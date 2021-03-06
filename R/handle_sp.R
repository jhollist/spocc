#' sp etc. objects handler
#'
#' Input various sp objects (e.g., x, y, z) and output WKT objects. If multiple polygons in the
#' sp object, separate calls are made to the web API since they don't support MULTIPOLYGON.
#'
#' @import rgeos
#' @param spobj A spatial object
#' @return One or more WKT strings
#' @keywords internal
#' @examples \dontrun{
#' library("sp")
#'
#' # A single polygons in a SpatialPolygons class
#' one <- Polygon(cbind(c(91,90,90,91), c(30,30,32,30)))
#' spone = Polygons(list(one), "s1")
#' sppoly = SpatialPolygons(list(spone), as.integer(1))
#' plot(sppoly)
#' handle_sp(spobj = sppoly)
#'
#' # Two polygons in a SpatialPolygons class
#' one <- Polygon(cbind(c(91,90,90,91), c(30,30,32,30)))
#' two <- Polygon(cbind(c(94,92,92,94), c(40,40,42,40)))
#' spone = Polygons(list(one), "s1")
#' sptwo = Polygons(list(two), "s2")
#' sppoly = SpatialPolygons(list(spone), as.integer(1))
#' plot(sppoly)
#' handle_sp(spobj = sppoly)
#'
#' # Another example
#' one <- Polygon(cbind(c(-121.0,-117.9,-121.0,-121.0), c(39.4, 37.1, 35.1, 39.4)))
#' two <- Polygon(cbind(c(-123.0,-121.2,-122.3,-124.5,-123.5,-124.1,-123.0),
#'                      c(44.8,42.9,41.9,42.6,43.3,44.3,44.8)))
#' spone = Polygons(list(one), "s1")
#' sptwo = Polygons(list(two), "s2")
#' sppoly = SpatialPolygons(list(spone, sptwo), 1:2)
#' plot(sppoly)
#' handle_sp(spobj=sppoly)
#'
#' # From SpatialPolygonsDataFrame class
#' sppoly_df <- SpatialPolygonsDataFrame(sppoly, data.frame(a=c(1,2), b=c("a","b"), c=c(TRUE,FALSE),
#' row.names=row.names(sppoly)))
#' handle_sp(sppoly_df)
#' }

handle_sp <- function(spobj){
  wkt <- writeWKT(spgeom = spobj, byid = TRUE)
  stopifnot(is.numeric(length(wkt)))
  stopifnot(length(wkt) > 0)
  return( wkt )
}
