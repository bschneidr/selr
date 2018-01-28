add_javascript <- function(in_html_doc = TRUE) {
  
js_lines <- c("//This JavaScript function changes the src for an image reference", 
              "function ChangeImageSrc(SelectInput) {", "    // Get the id of the select input, ", 
              "  var selectId = String(SelectInput.id);", "  // Get the selected value from the select input", 
              "  var SelectionValue = SelectInput.value;", "  var relevantClass = \"ImageSelection\";", 
              "  relevantClass = relevantClass + \" \" + selectId;", "", "  // List the inline text elements whose class marks them as being related to the select element", 
              "  var InlineTextElements = document.getElementsByClassName(relevantClass);", 
              "", "  // Loop over each inline text element, setting the text inside it to match", 
              "  // the text content corresponding to the selected option", 
              "", "  for (i = 0; i < InlineTextElements.length; i++) {", "    AffectedSpan = InlineTextElements[i];", 
              "    // Retrieve the results list from the span object, in the form of a string", 
              "    // that can be turned into a JSON object", "    var ResultsListDataString = String(AffectedSpan.getAttribute('resultlistdata', 0));", 
              "    // Turn the string into a JSON object", "    ResultListData = JSON.parse(ResultsListDataString);", 
              "    // Extract the selected value from the JSON, make sure that it's a string", 
              "    mystring = String(ResultListData[SelectionValue]);", "", 
              "    AffectedSpan.src = ResultListData[SelectionValue];", "  }", 
              "}", "", "//This JavaScript function changes in-line text", "function ChangeInlineText(SelectInput) {", 
              "  // Get the id of the select input, ", "  var selectId = String(SelectInput.id);", 
              "  // Get the selected value from the select input", "  var SelectionValue = SelectInput.value;", 
              "  var relevantClass = \"InlineTextSelection\";", "  relevantClass = relevantClass + \" \" + selectId;", 
              "", "  // List the inline text elements whose class marks them as being related to the select element", 
              "  var InlineTextElements = document.getElementsByClassName(relevantClass);", 
              "", "  // Loop over each inline text element, setting the text inside it to match", 
              "  // the text content corresponding to the selected option", 
              "", "  for (i = 0; i < InlineTextElements.length; i++) {", "    AffectedSpan = InlineTextElements[i];", 
              "    // Retrieve the results list from the span object, in the form of a string", 
              "    // that can be turned into a JSON object", "    var ResultsListDataString = String(AffectedSpan.getAttribute('resultlistdata', 0));", 
              "    // Turn the string into a JSON object", "    ResultListData = JSON.parse(ResultsListDataString);", 
              "    // Extract the selected value from the JSON, make sure that it's a string", 
              "    mystring = String(ResultListData[SelectionValue]);", "", 
              "    AffectedSpan.textContent = ResultListData[SelectionValue];", 
              "  }", "}", "", "// This adds an event listener to each r_select_html_selector that will,", 
              "// when the value of the selector changes,", "// run all of the content-swapping functions",
              "// NOTE: The 'DOMContentLoaded' listener is necessary to make sure that the selector listeners are only added once the document's DOM content has loaded.",
              "// This allows the script to be placed anywhere in the document, not just at the very end.",
              "document.addEventListener('DOMContentLoaded', function() {",
              "var r_select_html_selectors = document.getElementsByClassName('r_select_html_selector');", 
              "for (var i = 0; i < r_select_html_selectors.length; i++) {", 
              "    r_select_html_selectors[i].addEventListener('change', function() {ChangeInlineText(this); ChangeImageSrc(this);}, false);", 
              "}", "});")
  
  

  if (in_html_doc) {
    writeLines(utf8::utf8_encode(c("<script>",
                                  js_lines,
                                  "</script>")),
               sep = "\n")
  } else {
    writeLines(utf8::utf8_encode(js_lines))
  }

}
