[![DOI](https://zenodo.org/badge/DOI/10.1234/zenodo.1234567.svg)](https://doi.org/10.1234/zenodo.1234567) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) [![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

<img src="./logo/indiGO_Logo.png" width="150" style="float: right;"/>

# The indiGO R Package

The **indiGO (Indicators in Generalized Outputs)** R-package is designed to analyze and display global indicators of the status and trends in nature in a generalized and systematic way.

## Overview

The indiGO R-package provides an open-access framework that enables users to access annually and globally aggregated indicators as described in the [first Global Assessment Report on Biodiversity and Ecosystem Services](https://doi.org/10.5281/zenodo.3831673) of the Intergovernmental Science-Policy Platform on Biodiversity and Ecosystem Services (IPBES, 2019). It follows the standardization of indicators outlined in the supplemental material of the Global Assessment Report, [Chapter 2.2: Status and Trends – Nature](https://doi.org/10.5281/zenodo.3832005).

The package provides a flexible framework for handling a wide variety of indicators, not limited to a specific region, ecosystem, or time period. The generalized outputs are broad and adaptable, allowing users to apply them to various generalized data sets or indicator types across global or regional scales. Additionally, indiGO allows users to include their own data, enabling local data integration for customized indicator analysis.

## Key Features

-   **Access to Indicators**: Retrieve data of indicators related to the status and trends in nature.

-   **Standardization**: The package standardizes indicator data, ensuring a uniform format for analysis and visualization.

-   **Analysis & Visualization**: Provides functions to asses and compare indicators over time in generalized plots.

## Important Note

Please note that while the indiGO R-package is developed with reference to IPBES (2019), IPBES does not assume any accountability for the contents or outputs of the package.

## Installation

To install the package, run the following command in R:

```{r}
#Installation from GitHub

devtools::install_github("hetzerj/indiGO")
```

## How to Use

A demonstration of how to use the package is available [here](https://hetzerj.github.io/IA_quarto/).
