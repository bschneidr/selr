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
