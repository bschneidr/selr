
<!-- README.md is generated from README.Rmd. Please edit that file -->
rhtmlselect
===========

rhtmlselect adds functions that can be used in RMarkdown to add interactive functionality to HTML documents, using only client-side JavaScript. For instance, the creator of an RMarkdown document can add 'select' buttons that allow the user of the HTML document to swap the images and text that appear throughout the document.

Installation
------------

You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bschneidr/r_html_select")
```

Eventually, the package will be available on CRAN.

Example
-------

Here's a small example that shows how the package can be used to swap the text and plots in an HTML document depending on user input.

``` r
# NOTE: When using rhtmlselect in an RMarkdown chunk, you'll want to set results='asis'
library(rhtmlselect)
# For a particular HTML document, import the necessary Javascript
add_javascript(in_html_doc = TRUE)
```

``` r
# Add a selector button that the reader of the HTML document can interact with
add_selector(sel_id = 'dataset',
             options = c('Dataset_1' = "The arrests data",
                         'Dataset_2' = "The iris data",
                         'Dataset_3' = "The cars data"),
             label = "Select a dataset:")
```

``` r
# Create three plots which the user can choose
arrests_plot <- ggplot2::qplot(Murder, Assault, data = USArrests, main = "Arrests")
iris_plot <- ggplot2::qplot(Sepal.Length, Sepal.Width, data = iris, main = "Iris")
cars_plot <- ggplot2::qplot(mpg, wt, data = mtcars, colour = I("red"), main = "Cars")
# Place the plots into the RMarkdown document. 
# Only one plot will be shown at a time, depending on the value selected in the selector button.
sel_plot(sel_id = "dataset",
         options = list('Dataset_1' = arrests_plot,
                        'Dataset_2' = iris_plot,
                        'Dataset_3' = cars_plot),
         dev = 'png', fig.width = 6, fig.height = 3.5, dpi = 300,
         embed = TRUE)
```

``` r
# Add textual descriptions of the currently-selected dataset
sel_inline_text(sel_id = "dataset",
                options = list("Dataset_1" = "You've selected the arrests data. Good choice.",
                               "Dataset_2" = "You've selected the iris data- Fisher smiles upon you.",
                               "Dataset_3" = "You've selected the cars data- may you plumb its secrets."))
```

<!-- Don't forget to commit and push the resulting figure files, so they display on GitHub! -->