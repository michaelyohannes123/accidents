
# accidents

<!-- badges: start -->
<!-- badges: end -->

I made this R package to enable easy information retrieval regarding US car accident (2016-2020) data. This package was made as part of an assignment.

Dataset: https://www.kaggle.com/sobhanmoosavi/us-accidents

The purpose of the package, as stated earlier, is to make it easier to retrieve data from a US car accidents dataset that I am currently using for the project. The dataset has a large file size, making reading operations somewhat time consuming. As a result I decided to simplify that process by making it easy to retrieve a specific subsection of that dataset, depending what specific place the user wants to look at (getPlaceDataAsList(city, county, state)). This dataset subsection can also be retrieved and then converted into points (getPlaceDataAsPoints(city, county, state)). Additionally, through modifying the dataset's place name structure, I made the package be able to return the total list of places the dataset has accident data for (through getPlaceNames()), to make the place data retrieval process easier. Using this package is for educational purposes and non commercial use only.

## Installation

To install the package from R Studio do the following commands: 

``` r
library(devtools)
install_github("michaelyohannes123/accidents", subdir="accidents")
```

Once installed you can import the package as the following:

``` r
library(accidents)
```

## Example Commands

``` r
getPlaceNames()
getPlaceDataAsList("Chicago", "Cook", "IL")
getPlaceDataAsPoints("Chicago", "Cook", "IL")
```


