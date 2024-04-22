# Webspatialscan: an R package to enable spatial scan statistics on WebGIS applications  [![DOI](https://zenodo.org/badge/786540545.svg)](https://zenodo.org/doi/10.5281/zenodo.11036381)

To run this WebGIS application demo locally:
1. Get the *Webspatialscan* R package tar.gz file: https://drive.google.com/file/d/1fyy_MzayrXGKssxFrqyMwnpy3Ri-cSOV/view?usp=sharing
2. Install and load required R packages:
```
# install webspatialscan R package from tar.gz
install.packages("webspatialscan.v1_0.0.0.9000.tar.gz", repos = NULL, type = "source")
# install opencpu R package from CRAN
install.packages("opencpu")
# load opencpu R package
library(opencpu)
# Start opencpu server
ocpu_start_server()
```
3. Run the web application (available from the path __webspatialscan/inst/wwww/page_wms-up.html__ ) in your web browser
4. Use the demo dataset (available from the path __webspatialscan/data__ ) to test the application:
* Use the __cases.data.csv__ file for *"Arquivo de casos"* field
* Use the __pop.data.csv__ file for *"Arquivo de população"* field
* Use the __geo.data.csv__ file for *"Arquivo de coordenadas"* field
* Input __2016/1/1__ for *"Data início"* field
* Input __2016/12/31__  for *"Data fim"* field
* Choose whether you want to identify areas with high or low rates
* Set the maximum size of the spatial window

***Please NOTE:***
* To run the WebGIS application, you must have the *SatScan™*¹ desktop software installed on your computer
* This WebGIS application may not work depending on where the *SaTScan™*¹ software is installed in your local computer 
* You can use other dataset to test this application, but the data file must follow the same structure and format as the one provided in this repository 

## REFERENCES ##
1. KULLDORFF, M.; INFORMATION MANAGEMENT SERVICES INC. SaTScan v10.1.3: Software for the spatial and space-time scan statistics. Bethesda National Cancer Institute, , fev. 2024. Available at: <https://www.satscan.org/>.
