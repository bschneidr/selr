#' Add necessary JavaScript code to enable interactivity
#'
#' @param in_html_doc A single value, TRUE or FALSE, indicating whether the JavaScript should be included in the HTML document or if instead a separate '.js' file should be created.
#' @param filepath If `in_html_doc = FALSE`, the filepath of the '.js' JavaScript file to be created.
#'
#' @return Either outputs raw HTML/JavaScript code that can live inside an HTML file, or creates a '.js' file containing the JavaScript code.
#' @export
#'
#' @examples
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
add_javascript <- function(in_html_doc = TRUE,
                           filepath = NULL) {
  
  js_source_file <- system.file("js", "Add_Listener_and_Add_Change_Functions.js",
                                package = "selr")

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
