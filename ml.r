irisDF <- suppressWarnings(createDataFrame(iris))
# Fit a generalized linear model of family "gaussian" with spark.glm
gaussianDF <- irisDF
gaussianTestDF <- irisDF
gaussianGLM <- spark.glm(gaussianDF, Sepal_Length ~ Sepal_Width + Species, family = "gaussian")

# Save and then load a fitted MLlib model
modelPath <- tempfile(pattern = "ml", fileext = ".tmp")
write.ml(gaussianGLM, modelPath)
gaussianGLM2 <- read.ml(modelPath)

# Check model summary
summary(gaussianGLM2)

# Check model prediction
gaussianPredictions <- predict(gaussianGLM2, gaussianTestDF)
showDF(gaussianPredictions)

unlink(modelPath)