function ChangeImageSrc(SelectInput) {
    var selectId = String(SelectInput.id);
    var SelectionValue = SelectInput.value;
    var relevantClass = "SelrImageSelection";
    
    // Get list of elements to update
    var ImageSourceElements = document.getElementsByClassName(relevantClass);
    // Narrow list of elements to those for which the select input is one of the specified IDs
        // Define filter function to check whether element's 'r_sel_id' attribute includes the IDs
        function HasSelectId(ImageSourceElement) {
            var r_sel_id_list = ImageSourceElement.getAttribute('r_sel_id');
            var regex_to_check = "<sel_id>" + selectId + "</sel_id>";
            return RegExp(selectId).test(r_sel_id_list);
        }
        // Run the function
        var filter = Array.prototype.filter;
        var Relevant_Image_Source_Elements = filter.call(ImageSourceElements, HasSelectId);
        
    // Update each element
    for (i = 0; i < Relevant_Image_Source_Elements.length; i++) {
        AffectedElement = Relevant_Image_Source_Elements[i];
        var ResultsListDataString = String(AffectedElement.getAttribute("resultlistdata", 0));
        ResultListData = JSON.parse(ResultsListDataString);
        mystring = String(ResultListData[SelectionValue]);
        AffectedElement.src = ResultListData[SelectionValue];
    }
}

function ChangeInlineText(SelectInput) {
    var selectId = String(SelectInput.id);
    var SelectionValue = SelectInput.value;
    var relevantClass = "SelrTextSelection";
    
    // Get list of elements to update
    var InlineTextElements = document.getElementsByClassName(relevantClass);
    // Narrow list of elements to those for which the select input is one of the specified IDs
        // Define filter function to check whether element's 'r_sel_id' attribute includes the IDs
        function HasSelectId(InlineTextElement) {
            var r_sel_id_list = InlineTextElement.getAttribute('r_sel_id');
            var regex_to_check = "<sel_id>" + selectId + "</sel_id>";
            return RegExp(selectId).test(r_sel_id_list);
        }
        // Run the function
        var filter = Array.prototype.filter;
        var Relevant_InlineText_Elements = filter.call(InlineTextElements, HasSelectId);
    
    // Update each element
    for (i = 0; i < Relevant_InlineText_Elements.length; i++) {
        AffectedElement = Relevant_InlineText_Elements[i];
        var ResultsListDataString = String(AffectedElement.getAttribute("resultlistdata", 0));
        ResultListData = JSON.parse(ResultsListDataString);
        mystring = String(ResultListData[SelectionValue]);
        AffectedElement.textContent = ResultListData[SelectionValue];
    }
}

document.addEventListener("DOMContentLoaded", function() {
    var r_select_html_selectors = document.getElementsByClassName("r_select_html_selector");
    for (var i = 0; i < r_select_html_selectors.length; i++) {
        r_select_html_selectors[i].addEventListener("change", function() {
            ChangeInlineText(this);
            ChangeImageSrc(this);
        }, false);
    }
});
