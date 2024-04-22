#' Run SatScan algorithms from the web
#'
#' This function allows users to upload csv files, run SatScan software via rsatscan package and OpenCPU framework, and visualize purely spatial scan statistics results on a Leaflet interactive map, through a web application
#'
#' @export
#' @importFrom utils read.csv
#' @importFrom rsatscan write.cas
#' @importFrom rsatscan write.pop
#' @importFrom rsatscan write.geo
#' @importFrom rsatscan ss.options
#' @importFrom rsatscan write.ss.prm
#' @importFrom rsatscan satscan
#' @importFrom leaflet leaflet
#' @importFrom magrittr %>%
#' @importFrom leaflet addTiles
#' @importFrom leaflet addCircles
#' @importFrom leaflet addCircleMarkers
#' @importFrom leaflet addLayersControl
#' @importFrom leaflet addLegend
#' @importFrom leaflet layersControlOptions
#' @importFrom leaflet addScaleBar
#' @importFrom leaflet.extras addSearchOSM
#' @importFrom leaflet.extras searchOptions
#' @importFrom htmlwidgets saveWidget
#' @param file_cas csv file with cases data
#' @param file_pop csv file with population data
#' @param file_geo csv file with coordinates data
#' @param date_1 analysis start date
#' @param date_2 analysis end date
#' @param scan_area scanning areas with low or high rates
#' @param cluster_sz maximum cluster size population at risk


spatial_scanUp <- function(file_cas, file_pop, file_geo, date_1, date_2, scan_area, cluster_sz) {

  scan_areaStr <- paste("ScanAreas=", scan_area, sep = " ")
  cluster_szStr <- paste("MaxSpatialSizeInPopulationAtRisk=", cluster_sz, sep ="")

  df_cas <- read.csv(file_cas, sep = ";")
  df_pop <- read.csv(file_pop, sep = ";")
  df_geo <- read.csv(file_geo, sep = ";")

  td = tempdir()

  rsatscan::write.cas(df_cas, td, "SSCAN")
  rsatscan::write.pop(df_pop, td, "SSCAN")
  rsatscan::write.geo(df_geo, td, "SSCAN")

  invisible(ss.options(reset=TRUE, version="10.1"))

  rsatscan::ss.options(list(CaseFile="SSCAN.cas",  StartDate=date_1, EndDate=date_2, PopulationFile="SSCAN.pop", CoordinatesFile="SSCAN.geo", CoordinatesType=0, AnalysisType=1))
  rsatscan::ss.options(c("NonCompactnessPenalty=0", "ReportGiniClusters=n", "LogRunToHistoryFile=n" , scan_areaStr, cluster_szStr))

  rsatscan::write.ss.prm(td,"sscanresult")
  sink(file = "sscanresult_output.txt")

  sscanresult = rsatscan::satscan(td,"sscanresult", sslocation="C:/Program Files/SaTScan", ssbatchfilename="SaTScanBatch64")
  print(sscanresult)
  sink(file = NULL)

  cluster_data <- subset(sscanresult$col)
  location_data <- subset(sscanresult$gis)
  m <- leaflet(cluster_data) %>%
    addTiles(group = "Mapa") %>%
    addCircles(
      ~Y,
      ~X,
      radius = ~ifelse(RADIUS != 0, RADIUS * 125000, 12500),
      fillColor = ~ifelse(P_VALUE < 0.05, "red", "blue"),
      color = ~ifelse(P_VALUE < 0.05, "red", "blue"),
      weight = 1,
      fillOpacity = 0.2,
      popup = ~paste("<b>DETALHES DO CLUSTER </b>", "<br>",
                     "<b>Cluster: </b>", CLUSTER, "<br>",
                     "<b>Periodo analisado: </b>", START_DATE, END_DATE, "<br>",
                     "<b>População: </b>", POPULATION, "<br>",
                     "<b>Número de casos: </b>", OBSERVED, "<br>",
                     "<b>Número de casos esperados: </b>", EXPECTED, "<br>",
                     "<b>Número de casos / casos esperados: </b>", ODE, "<br>",
                     "<b>Risco Relativo: </b>", REL_RISK, "<br>",
                     "<b>P-Valor: </b>" , P_VALUE
      ),
      group = "Clusters detectados") %>%
    addCircleMarkers(
      data = location_data,
      ~LOC_Y,
      ~LOC_X,
      radius = 2,
      color = 'black',
      stroke = FALSE, fillOpacity = 0.7,
      popup = ~paste("<b>Local: </b>", LOC_ID),
      group = "Locais identificados") %>%
    addLayersControl(
      baseGroups = c("Mapa"),
      overlayGroups = c("Clusters detectados", "Locais identificados"),
      options = layersControlOptions(collapsed = FALSE)
    ) %>%
    addLegend(position = "bottomright",
              colors = c("red", "blue"),
              labels = c("Significativo (p < 0.05)" , "Não significativo (p > 0.05)"),
              title = "Significância estatística do cluster",
              opacity = 0.4) %>%
    addScaleBar(position = "bottomleft") %>%
    addSearchOSM(options = searchOptions(position = "topleft", autoCollapse = TRUE, hideMarkerOnCollapse = TRUE, zoom = 5))

  scan_map <- saveWidget(m, "sscanresult_map.html", selfcontained = FALSE)

}
