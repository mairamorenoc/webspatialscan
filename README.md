# R package for WebGIS application: webspatialscan
To run this WebGIS application demo locally:
1. Get webspatialscan R package tar.gz file: https://drive.google.com/file/d/1fyy_MzayrXGKssxFrqyMwnpy3Ri-cSOV/view?usp=sharing
2. Install and load R packages
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
2. Run the web application (available from the path __webspatialscan/inst/wwww/page_wms-up.html__ ) in your web browser
3. Use the demo data (available from the path __webspatialscan/data__ ) to test the application

***NOTE:***
* To run this WebGIS application, you must have the SatScan™ (1) desktop software installed on your computer.
* This WebGIS application may not work depending on where the SaTScan™ (1) software is installed in your local computer 

## REFERENCES ##
1. KULLDORFF, M.; INFORMATION MANAGEMENT SERVICES INC. SaTScan v10.1.3: Software for the spatial and space-time scan statistics. Bethesda National Cancer Institute, , fev. 2024. Available at: <https://www.satscan.org/>.
