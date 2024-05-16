# webspatialscan R package [![DOI](https://zenodo.org/badge/786540545.svg)](https://zenodo.org/doi/10.5281/zenodo.11036381)

# Overview

This R package for OpenCPU provides an interface between SatScan™ software and web-based GIS environments. 

The spatial scan statistics proposed by Kulldorff (1997) and Kulldorff and Nagarwalla (1995), along with SatScan™ software are well known and widely used validated methods for disease clusters detection. The aim of webspatialscan is to allow developers to integrate spatial scan statistics on WebGIS applications for public health surveillance, often lacking of advanced spatial statistical analysis features. In addition to having functions to read CSV files and execute Kulldorff's spatial scan algorithms, webspatialscan package also creates an interactive map widget that can be used as data visualization output to display the results to the users.

# Installation

You can install webspatialscan R package from this repository:
```
if (!require(devtools)) {
  install.packages("devtools")
}
library(devtools)

devtools::install_github("mairamorenoc/webspatialscan")
```
webspatialscan requires a [SatScan™](https://www.satscan.org/download.html) desktop software installation (tested on a Windows 11 machine), and if using a local R instance, the [OpenCPU](https://www.opencpu.org/download.html) local single-server implementation (tested on v2.2.10) is required as well. 

To know more about OpenCPU, check the [OpenCPU CRAN](https://cran.r-project.org/web/packages/opencpu/index.html) page for a complete description of the system, other implementations and its dependencies, as well as the official [OpenCPU GitHub repository](https://github.com/opencpu/opencpu-server) for further instructions on installing OpenCPU from source.

# Contributing

If you find any bugs, feel free to file an issue on the github issue tracker. Pull requests are welcome.

# Citing

If you use the webspatialscan package, please cite:

Moreno Castillo, M. A. (2024). webspatialscan R Package (v1.0.0). Zenodo. https://doi.org/10.5281/zenodo.11204542

# License

webspatialscan is distributed under a modified MIT license.

# References
KULLDORFF, Martin; NAGARWALLA, Neville. Spatial disease clusters: detection and inference. Statistics in medicine, v. 14, n. 8, p. 799-810, 1995.

KULLDORFF, Martin. A spatial scan statistic. Communications in Statistics-Theory and methods, v. 26, n. 6, p. 1481-1496, 1997.

KULLDORFF, M.; INFORMATION MANAGEMENT SERVICES INC. SaTScan v10.1.3: Software for the spatial and space-time scan statistics. Bethesda National Cancer Institute, 2024.

MORENO CASTILLO, M. A.; BARCELLOS NETO, C. Geoinformatics and health: review, characterization and analysis of WEB-based GIS platforms for public health surveillance. GeoFocus. International Review of Geographical Information Science and Technology, n. 32, p. 79–111, 2023. 

OOMS, Jeroen. The OpenCPU system: Towards a universal interface for scientific computing through separation of concerns. arXiv preprint arXiv:1406.4806, 2014.
