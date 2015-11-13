# train.R
# -------------------------------------------
# instructions for training a neural network
#
# Bastiaan Quast
# bquast@gmail.com

# model specification
m1 <- formula(zhfa ~ c_gen)


# basic estimation
pls1 <- lm(formula = m1, data = childder1)

# neural networks
library(nnet)
library(neuralnet)
library(NeuralNetTools)
library(caret)

# using nnet
nn1  <- nnet(formula = m1, data = childder1, size = 1)
plotnet(nn1)

# using neuralnet
nn1a <- neuralnet(formula = m1, data = childder1, hidden = 2)
plotnet(nn1a)
plot(nn1a, rep = 'best')

# using caret to use nnet
c1 <- train(form = m1, data = childder1, method = 'nnet')
plotnet(c1)
plot(c1)

# using caret to use neuralnet
c1a <- train(form = m1, data = childder1, method = 'neuralnet')
plotnet(c1a)
plot(c1a)
