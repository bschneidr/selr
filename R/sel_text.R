#' Create a dynamic text object
#'
#' @param sel_id The id of the selector used to choose options
#' @param options A named list, with the number of options and names of options matching those used in the selector object.
#' @param type Whether the HTML object should be a 'span' object or a 'div' object.
#'
#' @return Raw HTML representing the text object.
#' @export
#'
#' @examples
#' 
#' # RMarkdown code
#' 
#' ```{r add_js, results='asis'}
#' library(selr)
#' add_javascript()
#' ```
#' 
#' ```{r add_selector, results='asis'}
#' add_selector(
#' sel_id = "Language",
#' options = list("Option_1" = "English",
#'                "Option_2" = "Hebrew",
#'                "Option_3" = "Pirate")
#' )
#' ```
#' 
#' ```{r, results='asis'}
#' sel_text(
#' sel_id = "Language",
#' options = list("Option_1" = "Hello",
#'                "Option_2" = "Shalom",
#'                "Option_3" = "Ahoy")
#' )
#' ```
#' 
sel_text <- function(sel_id = "ts_1",
                            options = list('Option_1' = "The first option's text.",
                                           'Option_2' = "You get it.",
                                           'Option_3' = "We get it already."),
                            type = 'span') {
  
  if (!type %in% c("span", "div")) {
    stop("type must be either 'span' or 'div'")
  }
  
  element_class <- "SelrTextSelection"
  
  options <- setNames(object = as.list(as.character(options)),
                      nm = names(options))
  
  # Create JSON list of options
  result_list_data <- jsonlite::toJSON(options)
  result_list_data <- utf8::utf8_encode(result_list_data)
  
  # Create list of select ids
  sel_id_list <- paste0("<sel_id>", 
                        sel_id,
                        "</sel_id>",
                        collapse = "")
  
  if (type == 'span') {
  htmltools::span(options[1],
                  class = element_class,
                  r_sel_id = sel_id_list,
                  resultlistdata = result_list_data)
  } else if (type == 'div') {
    htmltools::div(options[1],
                   class = element_class,
                   r_sel_id = sel_id_list,
                   resultlistdata = result_list_data)
  }
}
