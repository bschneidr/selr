function ChangeImageSrc(SelectInput) {
    var selectId = String(SelectInput.id);
    var SelectionValue = SelectInput.value;
    var relevantClass = "ImageSelection";
    relevantClass = relevantClass + " " + selectId;
    var ImageSourceElements = document.getElementsByClassName(relevantClass);
    for (i = 0; i < ImageSourceElements.length; i++) {
        AffectedElement = ImageSourceElements[i];
        var ResultsListDataString = String(AffectedElement.getAttribute("resultlistdata", 0));
        ResultListData = JSON.parse(ResultsListDataString);
        mystring = String(ResultListData[SelectionValue]);
        AffectedElement.src = ResultListData[SelectionValue];
    }
}

function ChangeInlineText(SelectInput) {
    var selectId = String(SelectInput.id);
    var SelectionValue = SelectInput.value;
    var relevantClass = "InlineTextSelection";
    relevantClass = relevantClass + " " + selectId;
    var InlineTextElements = document.getElementsByClassName(relevantClass);
    for (i = 0; i < InlineTextElements.length; i++) {
        AffectedElement = InlineTextElements[i];
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
