sel_plot <- function(sel_id = "ts_1",
                     options = NULL,
                     embed = TRUE) {
  
  # If the embed option is chosen, then the links to the image files
  # are used to convert the image files to base64 strings so that the images
  # are embedded directly into the HTML document rather than referenced.
  # Otherwise, images files are created in the specified directory and referenced.
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
  
  span_class <- paste0("ImageSelection", " ", sel_id)
  
  result_list_data <- jsonlite::toJSON(options)
  
  # Display the first option
  htmltools::img(src = options[1],
                 class = span_class,
                 resultlistdata = result_list_data)
}
