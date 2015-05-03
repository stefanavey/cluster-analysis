shinyServer(function(input, output, session) {

  ## Difference between groups
  ## Summarizes data.
  ## Gives count, mean, standard deviation, standard error of the mean, and confidence interval (default 95%).
  ##   data: a data frame.
  ##   measurevar: the name of a column that contains the variable to be summariezed
  ##   groupvars: a vector containing names of columns that contain grouping variables
  ##   na.rm: a boolean that indicates whether to ignore NA's
  ##   conf.interval: the percent range of the confidence interval (default is 95%)
  ## function from http://www.cookbook-r.com/Manipulating_data/Summarizing_data/
  summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                        conf.interval=.95, .drop=TRUE) {
    require(plyr)
    ## New version of length which can handle NA's: if na.rm==T, don't count them
    length2 <- function (x, na.rm=FALSE) {
      if (na.rm) sum(!is.na(x))
      else       length(x)
    }
    ## This does the summary. For each group's data frame, return a vector with
    ## N, mean, and sd
    datac <- ddply(data, groupvars, .drop=.drop,
                   .fun = function(xx, col) {
                     c(N    = length2(xx[[col]], na.rm=na.rm),
                       mean = mean   (xx[[col]], na.rm=na.rm),
                       sd   = sd     (xx[[col]], na.rm=na.rm)
                       )
                   },
                   measurevar
                   )
    ## Rename the "mean" column
    datac <- rename(datac, c("mean" = measurevar))
    datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
    ## Confidence interval multiplier for standard error
    ## Calculate t-statistic for confidence interval:
    ## e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
    ciMult <- qt(conf.interval/2 + .5, datac$N-1)
    datac$ci <- datac$se * ciMult
    return(datac)
  }

  ## Combine the selected variables into a new data frame
  subSampleIris <- reactive({
    ddply(iris, .variables="Species", .fun=function(x) x[sample(50, input$numObs),])    
  })

  output$plot1 <- renderPlot({
    ## Code adapted from http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_%28ggplot2%29/
    ## dfc <- summarySE(iris, measurevar="Sepal.Length", groupvars="Species", conf.interval=.95)
    dfc <- lapply(colnames(subSampleIris())[1:4], function(col)
                  summarySE(subSampleIris(), measurevar=col, groupvars="Species", conf.interval=.95))
    dfc2 <- Reduce(rbind, lapply(dfc, as.matrix, dimnames=NULL))
    colnames(dfc2)[3] <- "x"
    dfc2 <- as.data.frame(dfc2)
    dfc2$Measurement <- factor(rep(colnames(subSampleIris())[1:4], each=3))
    dfc2[,2:6] <- apply(dfc2[,2:6], 2, function(col) as.numeric(as.character(col)))
    dfc3 <- melt(subSampleIris(), variable.name="Measurement", value.name="x")

    g <- ggplot(dfc2, aes(x=Measurement, y=x, fill=Species)) +
      geom_bar(position=position_dodge(), stat="identity") +
        scale_fill_manual(values=c("darkgrey", "red", "green3")) +
          ylab("Length (cm)") +
            ggtitle("Observed Mean Measurements") +
              theme_bw()

    if(input$points) {
      g <- g + geom_jitter(data=dfc3, aes(x=Measurement, y=x, fill=Species),
                           color="black", position=position_jitterdodge(0.9), shape=21)
    }
    if(input$eb != "None") { # if not none, add error bars
      column <- paste(sapply(unlist(strsplit(input$eb, " ")), function(str)
                             tolower(substr(str, 1,1))), collapse="")
      g <- g + geom_errorbar(aes_string(ymin=paste("x", column, sep='-'),
                                        ymax=paste("x", column, sep='+')),
                             width=.2, position=position_dodge(.9))
    }
    plot(g)
  })

})
