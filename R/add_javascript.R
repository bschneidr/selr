add_javascript <- function(in_html_doc = TRUE,
                           filepath = NULL) {
  
  js_source_file <- system.file("js", "Add_Listener_and_Add_Change_Functions.js",
                                package = "rhtmlselect")

  if (in_html_doc) {
    js_lines <- readLines(con = js_source_file)
    writeLines(utf8::utf8_encode(c("<script>",
                                  js_lines,
                                  "</script>")),
               sep = "\n")
  } else {
    if (is.null(filepath)) {
      stop("When 'in_html_doc' is FALSE, you must specify a filepath for the 'filepath' argument, such as 'add_listener_and_add_change_functions.js'.")
    } else {
      if (!endsWith(filepath, ".js")) {
        stop("The filepath argument must be a string ending with the '.js' extension.")
      }
    }
    file.copy(from = js_source_file,
              to = filepath,
              copy.mode = TRUE)
  }
}
