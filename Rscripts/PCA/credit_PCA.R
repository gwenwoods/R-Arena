# PCA example using credit data set

credit <- read.csv("../../Data/credit.csv")

pc_credit <- princomp(~ ., data = credit[,2:16], cor = TRUE)

str(pc_credit)

# pc_credit$loadings : the matrix for eigenvector
# pc_credit$scores[i,] : for the ith record, the coefficient of each component

#-----------------------------------------
# reconstruct for the first record

r1_comp <- pc_credit$scores[1,] * pc_credit$loadings[,]

r1_reconstruct <- rowSums(r1)

#-----------------------------------------
# compare the original and reconstruct first record

credit[1,2:16]
r1_reconstruct


