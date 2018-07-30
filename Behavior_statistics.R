setwd("/home/eleanor/Documents/gitrepos/aedes-aegypti-gcamp6s-larval-behavior")
data <- read.csv('individual_larva_calculations_GCAMP_R.csv')
data$background <- as.factor(data$background)
data$treatment_odor <- as.factor(data$treatment_odor)
data$sex <- as.factor(data$sex)
data$background <- relevel(data$background, ref="wt")
data$treatment_odor <- relevel(data$treatment_odor, ref="milliQ_water_100uL")

# remove dead animals from dataset and print row counts to make sure
nrow(data)
data <- subset(data, dead == 'False')
nrow(data)
colnames(data)

# subset data into experiment and acclimation phases
acclimate <- subset(data, Experiment_Acclimate == 'A')
experiment <- subset(data, Experiment_Acclimate == 'E')
acclimate$background <- relevel(acclimate$background, ref="wt")
experiment$background <- relevel(experiment$background, ref="wt")
acclimate$treatment_odor <- relevel(acclimate$treatment_odor, ref="milliQ_water_100uL")
experiment$treatment_odor <- relevel(experiment$treatment_odor, ref="milliQ_water_100uL")

######## 1-WAY ANOVAS ########
# See if there are differences observed between the strains during the acclimation phase

# PIs
res.aov1 <- aov(PI_.L.R.~background, data=acclimate)
summary(res.aov1) # NS

# Mean absolute speed
res.aov2 <- aov(mean_speed_mm~background, data=acclimate)
summary(res.aov2) # NS

######## 2-WAY ANOVA ########
# PIs for experiment: compare to see if there are strain specific effects on preference.
res.aov3 <- aov(PI_.L.R.~background+treatment_odor+background:treatment_odor, data=experiment)
summary(res.aov3) # NS for all except treatment

######## PAIRWISE T TESTS ########
########### 1-octen-3-ol ###########
octenol <- subset(data, treatment_odor == "1-octen-3-ol_100um")
gc <- subset(octenol, background == "gcamp")
or <- subset(octenol, background == "orco5_gcamp")
gr <- subset(octenol, background == "gr3_gcamp")

pairwise.t.test(gc$PI_.L.R., gc$Experiment_Acclimate) # NS
pairwise.t.test(or$PI_.L.R., or$Experiment_Acclimate) # NS
pairwise.t.test(gr$PI_.L.R., gr$Experiment_Acclimate) # NS

########### food ###########
food <- subset(data, treatment_odor == "filtered_food_odor_100uL")
gc <- subset(food, background == "gcamp")
or <- subset(food, background == "orco5_gcamp")
gr <- subset(food, background == "gr3_gcamp")

pairwise.t.test(gc$PI_.L.R., gc$Experiment_Acclimate) # p=0.043
pairwise.t.test(or$PI_.L.R., or$Experiment_Acclimate) # p=0.0053
pairwise.t.test(gr$PI_.L.R., gr$Experiment_Acclimate) # p=0.00019

########### water ###########
water <- subset(data, treatment_odor == "milliQ_water_100uL")
gc <- subset(water, background == "gcamp")
or <- subset(water, background == "orco5_gcamp")
gr <- subset(water, background == "gr3_gcamp")

pairwise.t.test(gc$PI_.L.R., gc$Experiment_Acclimate) # NS
pairwise.t.test(or$PI_.L.R., or$Experiment_Acclimate) # NS
pairwise.t.test(gr$PI_.L.R., gr$Experiment_Acclimate) # NS
