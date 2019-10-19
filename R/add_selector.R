#' Add an HTML select object
#'
#' @param sel_id A unique ID for the selector which can be referenced in other places.
#' @param options A named character vector. The elements of the character vector are the text visible in the select object. The names serve as option IDs which can be referenced in other places.
#' @param label The text to display along with the selector.
#'
#' @return Lines of HTML text which function as a selector.
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
add_selector <- function(sel_id = 'ts_1',
                         options = c('Option_1' = "Option #1",
                                     'Option_2' = "Option #2",
                                     'Option_3' = "Option #3"),
                         label = "Select an option:") {
  
  # Assemble the HTML for the label
  label_code <- paste0("<label ",
                       'for="', sel_id, '"', ">",
                       label, "</label>")
  # Assemble the HTML for the opening and closing select tags
  opening_tag <- paste0("<select ",
                        'id="', sel_id, '"', 'class="r_select_html_selector"', ">")
  closing_tag <- "</select>"
  
  # Assemple the HTML for each of the options inside the select tag
  option_tags <- vector(mode = 'character', length = length(options))
  
  for (option_index in seq_along(options)) {
    option_tags[option_index] <- paste0("<option ",
                                        "value=", '"', names(options)[option_index], '"', ">",
                                        options[option_index],
                                        "</option>")
  }
  # Combine the separate pieces of HTML and write the result
  result <- c(label_code,
              opening_tag,
              option_tags,
              closing_tag)
  writeLines(text = result, sep = "\n")
}