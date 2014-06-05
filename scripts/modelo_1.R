#
# TODO remover os NA's ou preencher? Como? Os exemplos ou os atributos?
#
# Deixar desbalanceado o dataset ou nao?
#

load('data/training_com_na.Rda')

# removendo atributos com mais de 100k NAs
training$DER_deltaeta_jet_jet <- NULL
training$DER_mass_jet_jet <- NULL
training$DER_prodeta_jet_jet <- NULL
training$DER_lep_eta_centrality <- NULL
training$PRI_jet_subleading_pt <- NULL
training$PRI_jet_subleading_eta <- NULL
training$PRI_jet_subleading_phi <- NULL

training <- training[complete.cases(training),]

# depois destas eliminacoes o dataset ficou um pouco menos desbalanceado

training$Weight <- NULL
training$EventId <- NULL

# nao executar na maquina local :(
library(randomForest)
model <- randomForest(Label ~. , data=training, do.trace=100, importance=TRUE)

