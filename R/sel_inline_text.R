sel_inline_text <- function(sel_id = "ts_1",
                            options = list('Option_1' = "The first option's text.",
                                           'Option_2' = "You get it.",
                                           'Option_3' = "We get it already.")) {
  
  span_class <- paste0("InlineTextSelection", " ", sel_id)
  
  options <- setNames(object = as.list(as.character(options)),
                      nm = names(options))
  
  result_list_data <- jsonlite::toJSON(options)
  result_list_data <- utf8::utf8_encode(result_list_data)
  
  htmltools::span(options[1],
                  class = span_class,
                  resultlistdata = result_list_data)
}
