#' Create a dynamic image object
#'
#' @param sel_id The id of the selector used to choose options
#' @param options A named list of filepaths, with the number of options and names of options matching those used in the selector object.
#' @param embed A logical vector for whether images should be embedded directly into the HTML code as base64 strings. If FALSE, image files are referred to via links in the HTML code.
#'
#' @return Raw HTML representing the image object
#' @export
#'
#' @examples
#'
#' \dontrun{ 
#' ```{r add_js, results='asis'}
#' library(selr)
#' add_javascript()
#' ```
#' 
#' ```{r add_selector, results='asis'}
#' add_selector(
#' sel_id = "Dataset",
#' options = list("Option_1" = "iris",
#'                "Option_2" = "mtcars",
#'                "Option_3" = "US Arrests")
#' )
#' ```
#' 
#' ```{r, results='asis'}
#' sel_text(
#' sel_id = "Dataset",
#' options = list("Option_1" = "Plots/Iris.png",
#'                "Option_2" = "Plots/mtcars.png",
#'                "Option_3" = "Plots/US Arrests.png")
#' )
#' ```
#' }
#' 
sel_image <- function(sel_id = "ts_1",
                      options = c("Option_1" = "Images/Iris.png", 
                                  "Option_2" = "Images/mtcars.png",
                                  "Option_3" = "Images/US Arrests.png"),
                      embed = TRUE) {
  # If the embed option is chosen, then the links to the image files
  # are used to convert the image files to base64 strings so that the images
  # are embedded directly into the HTML document rather than referenced
  if (embed) {
    options <- lapply(X = options,
                      FUN = knitr::image_uri)
    options <- setNames(as.list(as.character(options)),
                        names(options))
  } else {
    options <- setNames(as.list(as.character(options)),
                        names(options))
  }
  
  # Convert the options to JSON
  result_list_data <- jsonlite::toJSON(x = options)
  
  
  # Create list of select ids
  sel_id_list <- paste0("<sel_id>", 
                        sel_id,
                        "</sel_id>",
                        collapse = "")
  
  span_class <- "SelrImageSelection"
  
  # Display the first option
  htmltools::img(src = options[1],
                 class = span_class,
                 r_sel_id = sel_id_list,
                 resultlistdata = result_list_data)
}
