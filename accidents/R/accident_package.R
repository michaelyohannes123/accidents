#reading in the accidents data
accidentsData <- get(load("data/US_Accidents_Dec20.RData"))

#projection of the latitude-longitude points
projcrs <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

#returns the names of all of the places with accident data
#these names could be used, when splitting the names by ", "
#' getPlaceNames
#'
#' @return
#' @export
#'
#' @examples
#' getPlaceNames()
getPlaceNames <- function(){
  return(unlist(accidentsData$`City, County, State`))
}

#retrieve the available accidents data,
#given a city, county, state names as input
#' getPlaceDataAsList
#'
#' @param city city name
#' @param county county name
#' @param state state name
#'
#' @return
#' @export
#'
#' @examples
#' getPlaceDataAsList("Chicago", "Cook", "IL")
#' getPlaceDataAsList("city", "county", "state")
getPlaceDataAsList <- function(city, county, state){
  return(accidentsData[accidentsData$City==city &
                         accidentsData$County==county &
                         accidentsData$State==state,])
}

#retrieve the available accidents data,
#given a city, county, state names as input,
#in the form of points that could be mapped
#' getPlaceDataAsPoints
#'
#' @param city city name
#' @param county county name
#' @param state state name
#'
#' @return
#' @export
#'
#' @examples
#' getPlaceDataAsPoints("Chicago", "Cook", "IL")
#' getPlaceDataAsPoints("city", "county", "state")
getPlaceDataAsPoints <- function(city, county, state){
  data_df <- data.frame(accidentsData[accidentsData$City==city &
                                        accidentsData$County==county &
                                        accidentsData$State==state,])
  if(nrow(data_df) > 0){
    points <- sf::st_as_sf(x = data_df, coords = c("Start_Lng", "Start_Lat"), crs = projcrs)
    return(points)
  }else{
    return("No points due to no data for input place")
  }
}


