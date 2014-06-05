training <- read.csv("data/training.csv")

# metrica para avaliacao:

s_certos = 100
b_certos = 50
ams = sqrt(2 * ((s_certos + b_certos + 10) * log(1 + (s_certos + (b_certos + 10))) - s_certos))

# segundo a metrica de avaliacao, eh mais importante acertar os b's do que os s's

# neste dataset o valor -999.00 parece ser algum erro de medicao ou calculo
# eu vou transformar tudo que eh -999.00 em NA.

training[training == -999] <- NA

summary(training)

# nao processar na sua maquina local - demora muito
#tiff('reports/scatter_plot_vars_classes.tiff', width=1400, height=1200)
#plot(training[,2:31], pch=21, bg = c('red','green')[training$Label])
#dev.off()

# nao processar na sua maquina local - demora muito
#library(psych)
#tiff('reports/correlacao_entre_vargs.tiff', width=1400, height=1200)
#pairs.panels(training[,2:31], main='Correlação entre atributos independentes')
#dev.off()

tiff('reports/distribuicao_1.tiff', width=1200, height=800)
par(mfrow=c(4,4))
with(training[!is.na(training[,2]),], sm.density.compare(DER_mass_MMC, Label))
with(training[!is.na(training[,3]),], sm.density.compare(DER_mass_transverse_met_lep, Label))
with(training[!is.na(training[,4]),], sm.density.compare(DER_mass_vis, Label))
with(training[!is.na(training[,5]),], sm.density.compare(DER_pt_h, Label))
with(training[!is.na(training[,6]),], sm.density.compare(DER_deltaeta_jet_jet, Label))
with(training[!is.na(training[,7]),], sm.density.compare(DER_mass_jet_jet, Label))
with(training[!is.na(training[,8]),], sm.density.compare(DER_prodeta_jet_jet, Label))
with(training[!is.na(training[,9]),], sm.density.compare(DER_deltar_tau_lep, Label))
with(training[!is.na(training[,10]),], sm.density.compare(DER_pt_tot, Label))
with(training[!is.na(training[,11]),], sm.density.compare(DER_sum_pt, Label))
with(training[!is.na(training[,12]),], sm.density.compare(DER_pt_ratio_lep_tau, Label))
with(training[!is.na(training[,13]),], sm.density.compare(DER_met_phi_centrality, Label))
with(training[!is.na(training[,14]),], sm.density.compare(DER_lep_eta_centrality, Label))
with(training[!is.na(training[,15]),], sm.density.compare(PRI_tau_pt, Label))
with(training[!is.na(training[,16]),], sm.density.compare(PRI_tau_eta, Label))
with(training[!is.na(training[,17]),], sm.density.compare(PRI_tau_phi, Label))
dev.off()

tiff('reports/distribuicao_2.tiff', width=1200, height=800)
par(mfrow=c(4,4))
with(training[!is.na(training[,18]),], sm.density.compare(PRI_lep_pt, Label))
with(training[!is.na(training[,19]),], sm.density.compare(PRI_lep_eta, Label))
with(training[!is.na(training[,20]),], sm.density.compare(PRI_lep_phi, Label))
with(training[!is.na(training[,21]),], sm.density.compare(PRI_met, Label))
with(training[!is.na(training[,22]),], sm.density.compare(PRI_met_phi, Label))
with(training[!is.na(training[,23]),], sm.density.compare(PRI_met_sumet, Label))
with(training[!is.na(training[,24]),], sm.density.compare(PRI_jet_num, Label))
with(training[!is.na(training[,25]),], sm.density.compare(PRI_jet_leading_pt, Label))
with(training[!is.na(training[,26]),], sm.density.compare(PRI_jet_leading_eta, Label))
with(training[!is.na(training[,27]),], sm.density.compare(PRI_jet_leading_phi, Label))
with(training[!is.na(training[,28]),], sm.density.compare(PRI_jet_subleading_pt, Label))
with(training[!is.na(training[,29]),], sm.density.compare(PRI_jet_subleading_eta, Label))
with(training[!is.na(training[,30]),], sm.density.compare(PRI_jet_subleading_phi, Label))
with(training[!is.na(training[,31]),], sm.density.compare(PRI_jet_all_pt, Label))
dev.off()

save(training, file='data/training_com_na.Rda')
