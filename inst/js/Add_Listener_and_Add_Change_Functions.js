function ChangeImageSrc(SelectInput) {
    var selectId = String(SelectInput.id);
    var SelectionValue = SelectInput.value;
    var relevantClass = "ImageSelection";
    relevantClass = relevantClass + " " + selectId;
    var ImageSourceElements = document.getElementsByClassName(relevantClass);
    for (i = 0; i < ImageSourceElements.length; i++) {
        AffectedSpan = ImageSourceElements[i];
        var ResultsListDataString = String(AffectedSpan.getAttribute("resultlistdata", 0));
        ResultListData = JSON.parse(ResultsListDataString);
        mystring = String(ResultListData[SelectionValue]);
        AffectedSpan.src = ResultListData[SelectionValue];
    }
}

function ChangeInlineText(SelectInput) {
    var selectId = String(SelectInput.id);
    var SelectionValue = SelectInput.value;
    var relevantClass = "InlineTextSelection";
    relevantClass = relevantClass + " " + selectId;
    var InlineTextElements = document.getElementsByClassName(relevantClass);
    for (i = 0; i < InlineTextElements.length; i++) {
        AffectedSpan = InlineTextElements[i];
        var ResultsListDataString = String(AffectedSpan.getAttribute("resultlistdata", 0));
        ResultListData = JSON.parse(ResultsListDataString);
        mystring = String(ResultListData[SelectionValue]);
        AffectedSpan.textContent = ResultListData[SelectionValue];
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
