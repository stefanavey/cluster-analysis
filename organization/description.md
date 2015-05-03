Throughout our tutorial, we'll be walking through a famous published data set, the *Iris* flower data set. Published by Sir Ronald Fisher in 1936 ([Fisher 1936](http://onlinelibrary.wiley.com/doi/10.1111/j.1469-1809.1936.tb02137.x/pdf), it contains 50 samples from each of the three species of *Iris* (*Iris setosa*, *Iris virginica*, and *Iris versicolor*), with four features measured from each sample: the length and width of the sepals and petals, in centimeters. Using these data, we will be exploring different visualization approaches to help us in our interpretation of the data. 

The data table below contains the 150 observations (in rows) and 4 characteristics `Sepal.Length`, `Sepal.Width`, `Petal.Length`. In the original paper, Fisher separated the measurements out by Species, such that this formed a 50 row by 12 column (4 features for each of the 3 species; see Figure 1 in [Fisher 1936](http://onlinelibrary.wiley.com/doi/10.1111/j.1469-1809.1936.tb02137.x/pdf)). However, we can simplify the organization of this data by creating a new column - `Species`, with the categorical variables `setosa`, `virginica`, and `versicolor`. The remainder of the features are quantitative by definition.The data can be found in this form in the datasets package of the R environment `data(iris)`.

Let's take an interactive first look at this data to answer the following questions:

* Type in "7." into the box at the bottom of the `Sepal.Length` column to filter only on values containing a "7.". What do you notice about the `Species` composition?
* Filtering again on `Sepal.Length`, now try "1.". What do you get? How about a "2.", or a "3."? Or even "8."?
* Last, try filtering on `Sepal.Length` again, but this time on "4.". What do you notice about the `Species` composition this time?

What you'll notice immediately is that the species changes drastically depending on the sepal length - binning by integers, we get very different species at the low end (4) vs. the high end (7). How might we be able to tell what the ranges of our values are without manually checking?

Check out the `Summary` tab, to the right of `Data Table`. Here, you'll see some summary statistics of each feature, showing the **Min**imum, **Max**imum, the **1st**, **3rd**, and 2nd (**Median**) **Qu**artiles, and the **Mean**. We see immediately here that the `Sepal.Length` feature only spans from 4.3 to 7.9, which would explain why we don't get any values below or above that, respectively. Similarly, we can start to imagine how these values are distributed, but even for a this relatively small dataset with only 150 observations, any trends are hard to spot by looking at a data table of the numbers. Thus, we need effective visualization methods in order to further interpret the data.





