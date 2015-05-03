A common task in biology is to compare measurements between groups. Fisher himself does this in Figure 2 of the original paper where he compares the measurements of *versicolor* and *setosa*. These data are presented as an average of 50 observations in each group and the difference between averages. It is often helpful to visualize these differences in a barplot.

Something is missing, however, when only showing the means of the 50 samples. The variation in the sample is not shown. To include this, biologists use 'error bars' of some sort to quantify the uncertainty in the summary statistic (here the mean). These error bars allow us to assess how significant the differences in means are.

Some common types of error bars and a brief description:

* **Standard Deviation** : a *descriptive* error measure that quantifies the spread in the data. Calculated for a population sample as the square root of the sum of squared differences between the mean scaled by the sample size - 1. We denote the sample standard deviation as $SD$.
$$ SD = \sqrt{\frac{ \sum_i^n (x_{i} - \bar{x})^2}{n - 1}} $$
* **Standard Error** : an *inferential* error measure also sometimes referred to as *standard error of the mean* that measures the standard deviation of the mean. In the context of our example, we have measurements of petal length from 50 irises of the species *setosa*. We can summarize these by their mean. But we could have gathered 50 different plants from the same population. Then we would get a different estimate of the mean. If we repeat this many times we'd have a distribution of sample means. The *standard error of the mean* describes the standard deviation of this distribution. This is actually an estimate of the true *standard error*, which is the true standard deviation of the means of all samples of a fixed size. We denote the estimated standard error as $SE$.
$$ SE = \frac{SD}{\sqrt{n}} $$
* **Confidence Interval** : an *inferential* error measure that quantifies how often the true value of the parameter is in the observed confidence interval. Confidence intervals are often stated at the 95% confidence level. Assuming the data are normally distributed, we can calculate the 95% confidence interval around the mean by first calculating a t-statistic ($t$) from a t-distribution with $n-1$ degrees of freedom and then multiplying by the standard error. We denote the confidence interval as $CI$.
$$ CI = \bar{x} \pm (t * \frac{SD}{\sqrt{n}}) = \bar{x} \pm (t * SE) $$

Much more has been written about this [elsewhere](./deliverable.Rmd#errorbars). The most important thing is to know what the error bars actually represent and how that changes our interpretation. The plot below shows the means of each of the four measurements in each of the three species in a barplot. This type visualization is very common in biology and often contains error bars to quantify the variability in the mean. You can click `Show All Observations` to overlay the actual measured data points.  You can also change the number of data points used to calculate the mean and error bars by changing the `Number of Observations`. Each time this is changed, a new random sample of points is generated.

* Try selecting different error bars from the `Error Bars` drop down menu. What do you notice?
* Now select `Confidence Interval` (95% confidence interval) and use the arrows to decrease the `Number of Observations`. What happens?  How does this change if you select `Standard Deviation` or `Standard Error`?

As the `Number of Observations` gets very small, the error bars generally increase and are not very helpful. If there are only a few points, it may be better to just show all the points rather than using the mean and error bars.
