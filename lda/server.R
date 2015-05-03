library(scales) # for alpha function

shinyServer(function(input, output, session) {
    ## Perform classification with LDA and show classes
    ## Provide as reactive data set
    ## LDA
    x <- list()
    ## x$res <- prcomp(iris[,1:4])
    ## x$var <- x$res$sdev^2
    ## x$percVar <- x$var / sum(x$var)
    ## LDA
    if(require(MASS)) {
      ## Calculate fit in iris data
      lda.fit <- lda(Species ~ ., data=iris)
      x$prop <- lda.fit$svd^2/sum(lda.fit$svd^2)
      lda.pred <- predict(lda.fit)
      x$class <- lda.pred$class
      x$ld <- lda.pred$x
      x$misClass <- !x$class == iris$Species
      ## Calculate decision boundary
      n <- 20
      x1 <- seq(min(iris$Sepal.Length)-1, max(iris$Sepal.Length)+1, len=n)
      x2 <- seq(min(iris$Sepal.Width)-1, max(iris$Sepal.Width)+1, len=n)
      x3 <- seq(min(iris$Petal.Length)-1, max(iris$Petal.Length)+1, len=n)
      x4 <- seq(min(iris$Petal.Width)-1, max(iris$Petal.Width)+1, len=n)      
      newdat <- expand.grid(Sepal.Length=x1, Sepal.Width=x2,
                       Petal.Length=x3, Petal.Width=x4)
      lda.new.pred <- predict(lda.fit, newdata=newdat)
    }
    
    ## pch function to change shapes
    pch <- reactive({
        if (input$indicateSpecies) {
            as.numeric(iris$Species)
        } else {
            20
        }
    })

    ## Plot LDA
    ## Indicate True Species with shapes (pch function)
    output$ldaPlot <- renderPlot({
      if (input$missed) {
        color <- alpha(as.numeric(x$class), alpha=ifelse(x$misClass, 1, 0.05))
      } else {
        color <- as.numeric(x$class)
      }
      plot(x$ld[, 1], x$ld[, 2],
           col = color,
           pch = pch(),
           cex = 3,
           xlab=paste0("LD1 (", round(x$prop[1]*100), "%)"),
           ylab=paste0("LD2 (", round(x$prop[2]*100), "%)"))
      ## Add decision boundary
      if(input$boundary) {
        points(lda.new.pred$x[, 1], lda.new.pred$x[, 2],
               col = alpha(as.numeric(lda.new.pred$class), alpha=0.1),
               pch=1,
               cex = 0.3,
               xlab=paste0("LD1 (", round(x$prop[1]*100), "%)"),
               ylab=paste0("LD2 (", round(x$prop[2]*100), "%)"))
      }
      if(input$indicateSpecies) {
        legend("bottomright", unique(as.numeric(iris$Species)),
               unique(as.character(iris$Species)),
               pch=unique(as.numeric(iris$Species)))
      }
    })
  })
