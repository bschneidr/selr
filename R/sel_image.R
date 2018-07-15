sel_image <- function(sel_id = "ts_1",
                      options = c("Option_1" = "Images/FiveThirtyEight - Pareto Optimization in Restaurant Choice.png", 
                                  "Option_2" = "Images/FiveThirtyEight - Purple Reign.png",
                                  "Option_3" = "Images/FiveThirtyEight - The Art of Cherry-picking a Poll.png"),
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
  
  span_class <- "ImageSelection"
  
  # Display the first option
  htmltools::img(src = options[1],
                 class = span_class,
                 r_sel_id = sel_id_list,
                 resultlistdata = result_list_data)
}
