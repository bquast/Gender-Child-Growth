# train.R
# -------------------------------------------
# instructions for training a neural network
#
# Bastiaan Quast
# bquast@gmail.com



# load the data
load(file = 'data/merged.RData')

# model specification
mzhfa5 <- formula(zhfa ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome)

# basic linear model estimation
zhfa5 <- lm(mzhfa5, child, best_age_yrs < 6)
summary(zhfa5)

# neural networks
library(nnet)
library(neuralnet)
library(NeuralNetTools)
library(caret)

## create training and testing dataset
trainIndex <- createDataPartition(child$zhfa, p = 0.75)

## using nnet
nn1  <- nnet(formula = mzhfa5, data = child, size = c(8,5))
plotnet(nn1)

## using neuralnet
nn1a <- neuralnet(formula = m1, data = childder1, hidden = 1)
plotnet(nn1a)
plot(nn1a, rep = 'best')

## using caret to use nnet
c1 <- train(form = m1, data = childder1, method = 'nnet')
plotnet(c1)
plot(c1)

## using caret to use neuralnet
c1a <- train(form = m1, data = childder1, method = 'neuralnet')
plotnet(c1a)
plot(c1a)
