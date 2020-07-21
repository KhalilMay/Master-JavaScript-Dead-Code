library(dplyr) #may need an installation first
library(car) #may need an installation first
library(dunn.test)#may need an installation first


#Data for Energy Consumption of the experiments
level0Energy = read.csv(file="../Aggregate_Metrics/level0_Results_Energy.csv", header=TRUE, sep=",")
level1Energy = read.csv(file="../Aggregate_Metrics/level1_Results_Energy.csv", header=TRUE, sep=",")
level2Energy = read.csv(file="../Aggregate_Metrics/level2_Results_Energy.csv", header=TRUE, sep=",")
level3Energy = read.csv(file="../Aggregate_Metrics/level3_Results_Energy.csv", header=TRUE, sep=",")

#Add subject column to emulate the websites used for the experiment
#level0Energy$Webpage = 1:nrow(level0Energy)
#level1Energy$Webpage = 1:nrow(level1Energy)
#level2Energy$Webpage = 1:nrow(level2Energy)
#level3Energy$Webpage = 1:nrow(level3Energy)

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0EnergyTest <- data.frame('EnergyAll'= c(level0Energy$Run.1,level0Energy$Run.2,level0Energy$Run.3,level0Energy$Run.4,level0Energy$Run.5,level0Energy$Run.6,level0Energy$Run.7,level0Energy$Run.8,level0Energy$Run.9,level0Energy$Run.10,level0Energy$Run.11,level0Energy$Run.12,level0Energy$Run.13,level0Energy$Run.14,level0Energy$Run.15,level0Energy$Run.16,level0Energy$Run.17,level0Energy$Run.18,level0Energy$Run.19,level0Energy$Run.20), "Optimization.Level"=c(0))
level1EnergyTest <- data.frame('EnergyAll'= c(level1Energy$Run.1,level1Energy$Run.2,level1Energy$Run.3,level1Energy$Run.4,level1Energy$Run.5,level1Energy$Run.6,level1Energy$Run.7,level1Energy$Run.8,level1Energy$Run.9,level1Energy$Run.10,level1Energy$Run.11,level1Energy$Run.12,level1Energy$Run.13,level1Energy$Run.14,level1Energy$Run.15,level1Energy$Run.16,level1Energy$Run.17,level1Energy$Run.18,level1Energy$Run.19,level1Energy$Run.20), "Optimization.Level"=c(1))
level2EnergyTest <- data.frame('EnergyAll'= c(level2Energy$Run.1,level2Energy$Run.2,level2Energy$Run.3,level2Energy$Run.4,level2Energy$Run.5,level2Energy$Run.6,level2Energy$Run.7,level2Energy$Run.8,level2Energy$Run.9,level2Energy$Run.10,level2Energy$Run.11,level2Energy$Run.12,level2Energy$Run.13,level2Energy$Run.14,level2Energy$Run.15,level2Energy$Run.16,level2Energy$Run.17,level2Energy$Run.18,level2Energy$Run.19,level2Energy$Run.20), "Optimization.Level"=c(2))
level3EnergyTest <- data.frame('EnergyAll'= c(level3Energy$Run.1,level3Energy$Run.2,level3Energy$Run.3,level3Energy$Run.4,level3Energy$Run.5,level3Energy$Run.6,level3Energy$Run.7,level3Energy$Run.8,level3Energy$Run.9,level3Energy$Run.10,level3Energy$Run.11,level3Energy$Run.12,level3Energy$Run.13,level3Energy$Run.14,level3Energy$Run.15,level3Energy$Run.16,level3Energy$Run.17,level3Energy$Run.18,level3Energy$Run.19,level3Energy$Run.20), "Optimization.Level"=c(3))


#create new variable that contains all values of all OL
experimentEnergy = rbind(level0EnergyTest, level1EnergyTest, level2EnergyTest, level3EnergyTest)

#remove all not needed column
#experimentEnergy = select(experimentEnergy,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentEnergy$Optimization.Level = as.factor(experimentEnergy$Optimization.Level)
#experimentEnergy$Webpage = as.factor(experimentEnergy$Webpage)


#run test for energy consumption and show summary
#resultEnergy = aov(experimentEnergy$EnergyAll~experimentEnergy$Optimization.Level)

#summary(resultEnergy)

qqnorm(level0EnergyTest$EnergyAll, main="Normal Q-Q Plot of OL0 energy consumption ")
qqline(level0EnergyTest$EnergyAll)

qqnorm(level1EnergyTest$EnergyAll, main="Normal Q-Q Plot of OL1 energy consumption ")
qqline(level1EnergyTest$EnergyAll)

qqnorm(level2EnergyTest$EnergyAll, main="Normal Q-Q Plot of OL2 energy consumption ")
qqline(level2EnergyTest$EnergyAll)

qqnorm(level3EnergyTest$EnergyAll, main="Normal Q-Q Plot of OL3 energy consumption ")
qqline(level3EnergyTest$EnergyAll)


#Check for AVONA Assumptions using a Levene's Test for homogeneity of the variance and a test for normality check
shapiro.test(level0EnergyTest$EnergyAll)
shapiro.test(level1EnergyTest$EnergyAll)
shapiro.test(level2EnergyTest$EnergyAll)
shapiro.test(level3EnergyTest$EnergyAll)

kruskal.test(experimentEnergy$EnergyAll~experimentEnergy$Optimization.Level) #nonparamatric test instead of anova

#leveneTest(experimentEnergy$EnergyAll~experimentEnergy$Optimization.Level) #homogenous variance check

dunn.test(experimentEnergy$EnergyAll, g=experimentEnergy$Optimization.Level, method = "bonferroni")#pairwise comparision to check the mean difference between the groups

#pairwise.wilcox.test(experimentEnergy$EnergyAll , experimentEnergy$Optimization.Level, p.adjust.method = "holm")#pairwise comparision to check the mean difference between the groups
#---------------------------------------------------------------------------------------------------

#Data for Loading Times of the experiments
level0Loading = read.csv(file="../Aggregate_Metrics2/level0_Results_Load.csv", header=TRUE, sep=",")
level1Loading = read.csv(file="../Aggregate_Metrics2/level1_Results_Load.csv", header=TRUE, sep=",")
level2Loading = read.csv(file="../Aggregate_Metrics2/level2_Results_Load.csv", header=TRUE, sep=",")
level3Loading = read.csv(file="../Aggregate_Metrics2/level3_Results_Load.csv", header=TRUE, sep=",")

#Add subject column to emulate the websites used for the experiment
#level0Loading$Webpage = 1:nrow(level0Loading)
#level1Loading$Webpage = 1:nrow(level1Loading)
#level2Loading$Webpage = 1:nrow(level2Loading)
#level3Loading$Webpage = 1:nrow(level3Loading)

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0LoadingTest <- data.frame('LoadingAll'= c(level0Loading$Run.1,level0Loading$Run.2,level0Loading$Run.3,level0Loading$Run.4,level0Loading$Run.5,level0Loading$Run.6,level0Loading$Run.7,level0Loading$Run.8,level0Loading$Run.9,level0Loading$Run.10,level0Loading$Run.11,level0Loading$Run.12,level0Loading$Run.13,level0Loading$Run.14,level0Loading$Run.15,level0Loading$Run.16,level0Loading$Run.17,level0Loading$Run.18,level0Loading$Run.19,level0Loading$Run.20), "Optimization.Level"=c(0))
level1LoadingTest <- data.frame('LoadingAll'= c(level1Loading$Run.1,level1Loading$Run.2,level1Loading$Run.3,level1Loading$Run.4,level1Loading$Run.5,level1Loading$Run.6,level1Loading$Run.7,level1Loading$Run.8,level1Loading$Run.9,level1Loading$Run.10,level1Loading$Run.11,level1Loading$Run.12,level1Loading$Run.13,level1Loading$Run.14,level1Loading$Run.15,level1Loading$Run.16,level1Loading$Run.17,level1Loading$Run.18,level1Loading$Run.19,level1Loading$Run.20), "Optimization.Level"=c(1))
level2LoadingTest <- data.frame('LoadingAll'= c(level2Loading$Run.1,level2Loading$Run.2,level2Loading$Run.3,level2Loading$Run.4,level2Loading$Run.5,level2Loading$Run.6,level2Loading$Run.7,level2Loading$Run.8,level2Loading$Run.9,level2Loading$Run.10,level2Loading$Run.11,level2Loading$Run.12,level2Loading$Run.13,level2Loading$Run.14,level2Loading$Run.15,level2Loading$Run.16,level2Loading$Run.17,level2Loading$Run.18,level2Loading$Run.19,level2Loading$Run.20), "Optimization.Level"=c(2))
level3LoadingTest <- data.frame('LoadingAll'= c(level3Loading$Run.1,level3Loading$Run.2,level3Loading$Run.3,level3Loading$Run.4,level3Loading$Run.5,level3Loading$Run.6,level3Loading$Run.7,level3Loading$Run.8,level3Loading$Run.9,level3Loading$Run.10,level3Loading$Run.11,level3Loading$Run.12,level3Loading$Run.13,level3Loading$Run.14,level3Loading$Run.15,level3Loading$Run.16,level3Loading$Run.17,level3Loading$Run.18,level3Loading$Run.19,level3Loading$Run.20), "Optimization.Level"=c(3))


#create new variable that contains all values
experimentLoading = rbind(level0LoadingTest, level1LoadingTest, level2LoadingTest, level3LoadingTest)

#remove all the not needed column
#experimentLoading = select(experimentLoading,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentLoading$Optimization.Level = as.factor(experimentLoading$Optimization.Level)
#experimentLoading$Webpage = as.factor(experimentLoading$Webpage)

#QQPLOTS for normality
qqnorm(level0LoadingTest$LoadingAll, main="Normal Q-Q Plot of OL0 loading time ")
qqline(level0LoadingTest$LoadingAll)

qqnorm(level1LoadingTest$LoadingAll, main="Normal Q-Q Plot of OL1 loading time ")
qqline(level1LoadingTest$LoadingAll)

qqnorm(level2LoadingTest$LoadingAll, main="Normal Q-Q Plot of OL2 loading time ")
qqline(level2LoadingTest$LoadingAll)

qqnorm(level3LoadingTest$LoadingAll, main="Normal Q-Q Plot of OL3 loading time")
qqline(level3LoadingTest$LoadingAll)

#Check for AVONA Assumptions using a Levene's Test for homogeneity of the variance and a test for normality check
shapiro.test(level0LoadingTest$LoadingAll)
shapiro.test(level1LoadingTest$LoadingAll)
shapiro.test(level2LoadingTest$LoadingAll)
shapiro.test(level3LoadingTest$LoadingAll)

kruskal.test(experimentLoading$LoadingAll~experimentLoading$Optimization.Level) #nonparamatric test instead of anova

dunn.test(experimentLoading$LoadingAll, g=experimentLoading$Optimization.Level, method = "bonferroni")#pairwise comparision to check the mean difference between the groups
#--------------------------------------------------------------------------------------------------------------------------

#Data for CPU of the experiments
level0CPU = read.csv(file="../Aggregate_Metrics/level0_Results_CPU.csv", header=TRUE, sep=",")
level1CPU = read.csv(file="../Aggregate_Metrics/level1_Results_CPU.csv", header=TRUE, sep=",")
level2CPU = read.csv(file="../Aggregate_Metrics/level2_Results_CPU.csv", header=TRUE, sep=",")
level3CPU = read.csv(file="../Aggregate_Metrics/level3_Results_CPU.csv", header=TRUE, sep=",")

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0CPUTest <- data.frame('CPUAll'= c(level0CPU$Run.1,level0CPU$Run.2,level0CPU$Run.3,level0CPU$Run.4,level0CPU$Run.5,level0CPU$Run.6,level0CPU$Run.7,level0CPU$Run.8,level0CPU$Run.9,level0CPU$Run.10,level0CPU$Run.11,level0CPU$Run.12,level0CPU$Run.13,level0CPU$Run.14,level0CPU$Run.15,level0CPU$Run.16,level0CPU$Run.17,level0CPU$Run.18,level0CPU$Run.19,level0CPU$Run.20), "Optimization.Level"=c(0))
level1CPUTest <- data.frame('CPUAll'= c(level1CPU$Run.1,level1CPU$Run.2,level1CPU$Run.3,level1CPU$Run.4,level1CPU$Run.5,level1CPU$Run.6,level1CPU$Run.7,level1CPU$Run.8,level1CPU$Run.9,level1CPU$Run.10,level1CPU$Run.11,level1CPU$Run.12,level1CPU$Run.13,level1CPU$Run.14,level1CPU$Run.15,level1CPU$Run.16,level1CPU$Run.17,level1CPU$Run.18,level1CPU$Run.19,level1CPU$Run.20), "Optimization.Level"=c(1))
level2CPUTest <- data.frame('CPUAll'= c(level2CPU$Run.1,level2CPU$Run.2,level2CPU$Run.3,level2CPU$Run.4,level2CPU$Run.5,level2CPU$Run.6,level2CPU$Run.7,level2CPU$Run.8,level2CPU$Run.9,level2CPU$Run.10,level2CPU$Run.11,level2CPU$Run.12,level2CPU$Run.13,level2CPU$Run.14,level2CPU$Run.15,level2CPU$Run.16,level2CPU$Run.17,level2CPU$Run.18,level2CPU$Run.19,level2CPU$Run.20), "Optimization.Level"=c(2))
level3CPUTest <- data.frame('CPUAll'= c(level3CPU$Run.1,level3CPU$Run.2,level3CPU$Run.3,level3CPU$Run.4,level3CPU$Run.5,level3CPU$Run.6,level3CPU$Run.7,level3CPU$Run.8,level3CPU$Run.9,level3CPU$Run.10,level3CPU$Run.11,level3CPU$Run.12,level3CPU$Run.13,level3CPU$Run.14,level3CPU$Run.15,level3CPU$Run.16,level3CPU$Run.17,level3CPU$Run.18,level3CPU$Run.19,level3CPU$Run.20), "Optimization.Level"=c(3))


#create new variable that contains all values
experimentCPU = rbind(level0CPUTest, level1CPUTest, level2CPUTest, level3CPUTest)

#remove all the not needed column
#experimentCPU = select(experimentCPU,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentCPU$Optimization.Level = as.factor(experimentCPU$Optimization.Level)

#QQPLOTS for normality
qqnorm(level0CPUTest$CPUAll, main="Normal Q-Q Plot of OL0 CPU usage ")
qqline(level0CPUTest$CPUAll)

qqnorm(level1CPUTest$CPUAll, main="Normal Q-Q Plot of OL1 CPU usage ")
qqline(level1CPUTest$CPUAll)

qqnorm(level2CPUTest$CPUAll, main="Normal Q-Q Plot of OL2 CPU usage ")
qqline(level2CPUTest$CPUAll)

qqnorm(level3CPUTest$CPUAll, main="Normal Q-Q Plot of OL3 CPU usage")
qqline(level3CPUTest$CPUAll)


#Check for AVONA Assumptions using a Levene's Test for homogeneity of the variance and a test for normality check
shapiro.test(level0CPUTest$CPUAll)
shapiro.test(level1CPUTest$CPUAll)
shapiro.test(level2CPUTest$CPUAll)
shapiro.test(level3CPUTest$CPUAll)

kruskal.test(experimentCPU$CPUAll~experimentCPU$Optimization.Level) #nonparamatric test instead of anova if normality is violated

dunn.test(experimentCPU$CPUAll, g=experimentCPU$Optimization.Level, method = "bonferroni")#pairwise comparision to check the mean difference between the groups

#--------------------------------------------------------------------------------------------------------------------------

#Data for Memory of the experiments
level0Memory = read.csv(file="../Aggregate_Metrics/level0_Results_Memory.csv", header=TRUE, sep=",")
level1Memory = read.csv(file="../Aggregate_Metrics/level1_Results_Memory.csv", header=TRUE, sep=",")
level2Memory = read.csv(file="../Aggregate_Metrics/level2_Results_Memory.csv", header=TRUE, sep=",")
level3Memory = read.csv(file="../Aggregate_Metrics/level3_Results_Memory.csv", header=TRUE, sep=",")

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0MemoryTest <- data.frame('MemoryAll'= c(level0Memory$Run.1,level0Memory$Run.2,level0Memory$Run.3,level0Memory$Run.4,level0Memory$Run.5,level0Memory$Run.6,level0Memory$Run.7,level0Memory$Run.8,level0Memory$Run.9,level0Memory$Run.10,level0Memory$Run.11,level0Memory$Run.12,level0Memory$Run.13,level0Memory$Run.14,level0Memory$Run.15,level0Memory$Run.16,level0Memory$Run.17,level0Memory$Run.18,level0Memory$Run.19,level0Memory$Run.20), "Optimization.Level"=c(0))
level1MemoryTest <- data.frame('MemoryAll'= c(level1Memory$Run.1,level1Memory$Run.2,level1Memory$Run.3,level1Memory$Run.4,level1Memory$Run.5,level1Memory$Run.6,level1Memory$Run.7,level1Memory$Run.8,level1Memory$Run.9,level1Memory$Run.10,level1Memory$Run.11,level1Memory$Run.12,level1Memory$Run.13,level1Memory$Run.14,level1Memory$Run.15,level1Memory$Run.16,level1Memory$Run.17,level1Memory$Run.18,level1Memory$Run.19,level1Memory$Run.20), "Optimization.Level"=c(1))
level2MemoryTest <- data.frame('MemoryAll'= c(level2Memory$Run.1,level2Memory$Run.2,level2Memory$Run.3,level2Memory$Run.4,level2Memory$Run.5,level2Memory$Run.6,level2Memory$Run.7,level2Memory$Run.8,level2Memory$Run.9,level2Memory$Run.10,level2Memory$Run.11,level2Memory$Run.12,level2Memory$Run.13,level2Memory$Run.14,level2Memory$Run.15,level2Memory$Run.16,level2Memory$Run.17,level2Memory$Run.18,level2Memory$Run.19,level2Memory$Run.20), "Optimization.Level"=c(2))
level3MemoryTest <- data.frame('MemoryAll'= c(level3Memory$Run.1,level3Memory$Run.2,level3Memory$Run.3,level3Memory$Run.4,level3Memory$Run.5,level3Memory$Run.6,level3Memory$Run.7,level3Memory$Run.8,level3Memory$Run.9,level3Memory$Run.10,level3Memory$Run.11,level3Memory$Run.12,level3Memory$Run.13,level3Memory$Run.14,level3Memory$Run.15,level3Memory$Run.16,level3Memory$Run.17,level3Memory$Run.18,level3Memory$Run.19,level3Memory$Run.20), "Optimization.Level"=c(3))

#create new variable that contains all values
experimentMemory = rbind(level0MemoryTest, level1MemoryTest, level2MemoryTest, level3MemoryTest)

#remove all the not needed column
#experimentMemory = select(experimentMemory,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentMemory$Optimization.Level = as.factor(experimentMemory$Optimization.Level)

#QQPLOTS for normality
qqnorm(level0MemoryTest$MemoryAll/1024, main="Normal Q-Q Plot of OL0 memory consumption ")
qqline(level0MemoryTest$MemoryAll/1024)

qqnorm(level1MemoryTest$MemoryAll/1024, main="Normal Q-Q Plot of OL1 memory consumption ")
qqline(level1MemoryTest$MemoryAll/1024)

qqnorm(level2MemoryTest$MemoryAll/1024, main="Normal Q-Q Plot of OL2 memory consumption ")
qqline(level2MemoryTest$MemoryAll/1024)

qqnorm(level3MemoryTest$MemoryAll/1024, main="Normal Q-Q Plot of OL3 memory consumption")
qqline(level3MemoryTest$MemoryAll/1024)

#Check for AVONA Assumptions, shapiro test for normality check
shapiro.test(level0MemoryTest$MemoryAll)
shapiro.test(level1MemoryTest$MemoryAll)
shapiro.test(level2MemoryTest$MemoryAll)
shapiro.test(level3MemoryTest$MemoryAll)

kruskal.test(experimentMemory$MemoryAll~experimentMemory$Optimization.Level) #nonparamatric test instead of anova if normality is violated

dunn.test(experimentMemory$MemoryAll, g=experimentMemory$Optimization.Level, method = "bonferroni")#pairwise comparision to check the mean difference between the groups
#--------------------------------------------------------------------------------------------------------------------------

#Data for FP of the experiments
level0FP = read.csv(file="../Aggregate_Metrics2/level0_Results_Fp.csv", header=TRUE, sep=",")
level1FP = read.csv(file="../Aggregate_Metrics2/level1_Results_Fp.csv", header=TRUE, sep=",")
level2FP = read.csv(file="../Aggregate_Metrics2/level2_Results_Fp.csv", header=TRUE, sep=",")
level3FP = read.csv(file="../Aggregate_Metrics2/level3_Results_Fp.csv", header=TRUE, sep=",")

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0FPTest <- data.frame('FPAll'= c(level0FP$Run.1,level0FP$Run.2,level0FP$Run.3,level0FP$Run.4,level0FP$Run.5,level0FP$Run.6,level0FP$Run.7,level0FP$Run.8,level0FP$Run.9,level0FP$Run.10,level0FP$Run.11,level0FP$Run.12,level0FP$Run.13,level0FP$Run.14,level0FP$Run.15,level0FP$Run.16,level0FP$Run.17,level0FP$Run.18,level0FP$Run.19,level0FP$Run.20), "Optimization.Level"=c(0))
level1FPTest <- data.frame('FPAll'= c(level1FP$Run.1,level1FP$Run.2,level1FP$Run.3,level1FP$Run.4,level1FP$Run.5,level1FP$Run.6,level1FP$Run.7,level1FP$Run.8,level1FP$Run.9,level1FP$Run.10,level1FP$Run.11,level1FP$Run.12,level1FP$Run.13,level1FP$Run.14,level1FP$Run.15,level1FP$Run.16,level1FP$Run.17,level1FP$Run.18,level1FP$Run.19,level1FP$Run.20), "Optimization.Level"=c(1))
level2FPTest <- data.frame('FPAll'= c(level2FP$Run.1,level2FP$Run.2,level2FP$Run.3,level2FP$Run.4,level2FP$Run.5,level2FP$Run.6,level2FP$Run.7,level2FP$Run.8,level2FP$Run.9,level2FP$Run.10,level2FP$Run.11,level2FP$Run.12,level2FP$Run.13,level2FP$Run.14,level2FP$Run.15,level2FP$Run.16,level2FP$Run.17,level2FP$Run.18,level2FP$Run.19,level2FP$Run.20), "Optimization.Level"=c(2))
level3FPTest <- data.frame('FPAll'= c(level3FP$Run.1,level3FP$Run.2,level3FP$Run.3,level3FP$Run.4,level3FP$Run.5,level3FP$Run.6,level3FP$Run.7,level3FP$Run.8,level3FP$Run.9,level3FP$Run.10,level3FP$Run.11,level3FP$Run.12,level3FP$Run.13,level3FP$Run.14,level3FP$Run.15,level3FP$Run.16,level3FP$Run.17,level3FP$Run.18,level3FP$Run.19,level3FP$Run.20), "Optimization.Level"=c(3))

#create new variable that contains all values
experimentFP = rbind(level0FPTest, level1FPTest, level2FPTest, level3FPTest)

#remove all the not needed column
#experimentFP = select(experimentFP,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentFP$Optimization.Level = as.factor(experimentFP$Optimization.Level)

#QQPLOTS for normality
qqnorm(level0FPTest$FPAll, main="Normal Q-Q Plot of OL0 FP ")
qqline(level0FPTest$FPAll)

qqnorm(level1FPTest$FPAll, main="Normal Q-Q Plot of OL1 FP ")
qqline(level1FPTest$FPAll)

qqnorm(level2FPTest$FPAll, main="Normal Q-Q Plot of OL2 FP ")
qqline(level2FPTest$FPAll)

qqnorm(level3FPTest$FPAll, main="Normal Q-Q Plot of OL3 FP")
qqline(level3FPTest$FPAll)


#Check for AVONA Assumptions using a Levene's Test for homogeneity of the variance and a test for normality check
shapiro.test(level0FPTest$FPAll)
shapiro.test(level1FPTest$FPAll)
shapiro.test(level2FPTest$FPAll)
shapiro.test(level3FPTest$FPAll)

kruskal.test(experimentFP$FPAll~experimentFP$Optimization.Level) #nonparamatric test instead of anova if normality is violated

dunn.test(experimentFP$FPAll, g=experimentFP$Optimization.Level, method = "bonferroni")#pairwise comparision to check the mean difference between the groups
#--------------------------------------------------------------------------------------------------------------------------

#Data for FCP of the experiments
level0FCP = read.csv(file="../Aggregate_Metrics2/level0_Results_Fcp.csv", header=TRUE, sep=",")
level1FCP = read.csv(file="../Aggregate_Metrics2/level1_Results_Fcp.csv", header=TRUE, sep=",")
level2FCP = read.csv(file="../Aggregate_Metrics2/level2_Results_Fcp.csv", header=TRUE, sep=",")
level3FCP = read.csv(file="../Aggregate_Metrics2/level3_Results_Fcp.csv", header=TRUE, sep=",")

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0FCPTest <- data.frame('FCPAll'= c(level0FCP$Run.1,level0FCP$Run.2,level0FCP$Run.3,level0FCP$Run.4,level0FCP$Run.5,level0FCP$Run.6,level0FCP$Run.7,level0FCP$Run.8,level0FCP$Run.9,level0FCP$Run.10,level0FCP$Run.11,level0FCP$Run.12,level0FCP$Run.13,level0FCP$Run.14,level0FCP$Run.15,level0FCP$Run.16,level0FCP$Run.17,level0FCP$Run.18,level0FCP$Run.19,level0FCP$Run.20), "Optimization.Level"=c(0))
level1FCPTest <- data.frame('FCPAll'= c(level1FCP$Run.1,level1FCP$Run.2,level1FCP$Run.3,level1FCP$Run.4,level1FCP$Run.5,level1FCP$Run.6,level1FCP$Run.7,level1FCP$Run.8,level1FCP$Run.9,level1FCP$Run.10,level1FCP$Run.11,level1FCP$Run.12,level1FCP$Run.13,level1FCP$Run.14,level1FCP$Run.15,level1FCP$Run.16,level1FCP$Run.17,level1FCP$Run.18,level1FCP$Run.19,level1FCP$Run.20), "Optimization.Level"=c(1))
level2FCPTest <- data.frame('FCPAll'= c(level2FCP$Run.1,level2FCP$Run.2,level2FCP$Run.3,level2FCP$Run.4,level2FCP$Run.5,level2FCP$Run.6,level2FCP$Run.7,level2FCP$Run.8,level2FCP$Run.9,level2FCP$Run.10,level2FCP$Run.11,level2FCP$Run.12,level2FCP$Run.13,level2FCP$Run.14,level2FCP$Run.15,level2FCP$Run.16,level2FCP$Run.17,level2FCP$Run.18,level2FCP$Run.19,level2FCP$Run.20), "Optimization.Level"=c(2))
level3FCPTest <- data.frame('FCPAll'= c(level3FCP$Run.1,level3FCP$Run.2,level3FCP$Run.3,level3FCP$Run.4,level3FCP$Run.5,level3FCP$Run.6,level3FCP$Run.7,level3FCP$Run.8,level3FCP$Run.9,level3FCP$Run.10,level3FCP$Run.11,level3FCP$Run.12,level3FCP$Run.13,level3FCP$Run.14,level3FCP$Run.15,level3FCP$Run.16,level3FCP$Run.17,level3FCP$Run.18,level3FCP$Run.19,level3FCP$Run.20), "Optimization.Level"=c(3))

#create new variable that contains all values
experimentFCP = rbind(level0FCPTest, level1FCPTest, level2FCPTest, level3FCPTest)

#remove all the not needed column
#experimentFCP = select(experimentFCP,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentFCP$Optimization.Level = as.factor(experimentFCP$Optimization.Level)

#QQPLOTS for normality
qqnorm(level0FCPTest$FCPAll, main="Normal Q-Q Plot of OL0 FCP ")
qqline(level0FCPTest$FCPAll)

qqnorm(level1FCPTest$FCPAll, main="Normal Q-Q Plot of OL1 FCP ")
qqline(level1FCPTest$FCPAll)

qqnorm(level2FCPTest$FCPAll, main="Normal Q-Q Plot of OL2 FCP ")
qqline(level2FCPTest$FCPAll)

qqnorm(level3FCPTest$FCPAll, main="Normal Q-Q Plot of OL3 FCP")
qqline(level3FCPTest$FCPAll)


#Check for AVONA Assumptions using a Levene's Test for homogeneity of the variance and a test for normality check
shapiro.test(level0FCPTest$FCPAll)
shapiro.test(level1FCPTest$FCPAll)
shapiro.test(level2FCPTest$FCPAll)
shapiro.test(level3FCPTest$FCPAll)

kruskal.test(experimentFCP$FCPAll~experimentFCP$Optimization.Level) #nonparamatric test instead of anova if normality is violated

dunn.test(experimentFCP$FCPAll, g=experimentFCP$Optimization.Level, method = "bonferroni")#pairwise comparision to check the mean difference between the groups

#--------------------------------------------------------------------------------------------------------------------------

#Data for Packets of the experiments
level0Packets = read.csv(file="../Aggregate_Metrics3/level0_Results_Packets.csv", header=TRUE, sep=",")
level1Packets = read.csv(file="../Aggregate_Metrics3/level1_Results_Packets.csv", header=TRUE, sep=",")
level2Packets = read.csv(file="../Aggregate_Metrics3/level2_Results_Packets.csv", header=TRUE, sep=",")
level3Packets = read.csv(file="../Aggregate_Metrics3/level3_Results_Packets.csv", header=TRUE, sep=",")

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0PacketsTest <- data.frame('PacketsAll'= c(level0Packets$Run.1,level0Packets$Run.2,level0Packets$Run.3,level0Packets$Run.4,level0Packets$Run.5,level0Packets$Run.6,level0Packets$Run.7,level0Packets$Run.8,level0Packets$Run.9,level0Packets$Run.10,level0Packets$Run.11,level0Packets$Run.12,level0Packets$Run.13,level0Packets$Run.14,level0Packets$Run.15,level0Packets$Run.16,level0Packets$Run.17,level0Packets$Run.18,level0Packets$Run.19,level0Packets$Run.20), "Optimization.Level"=c(0))
level1PacketsTest <- data.frame('PacketsAll'= c(level1Packets$Run.1,level1Packets$Run.2,level1Packets$Run.3,level1Packets$Run.4,level1Packets$Run.5,level1Packets$Run.6,level1Packets$Run.7,level1Packets$Run.8,level1Packets$Run.9,level1Packets$Run.10,level1Packets$Run.11,level1Packets$Run.12,level1Packets$Run.13,level1Packets$Run.14,level1Packets$Run.15,level1Packets$Run.16,level1Packets$Run.17,level1Packets$Run.18,level1Packets$Run.19,level1Packets$Run.20), "Optimization.Level"=c(1))
level2PacketsTest <- data.frame('PacketsAll'= c(level2Packets$Run.1,level2Packets$Run.2,level2Packets$Run.3,level2Packets$Run.4,level2Packets$Run.5,level2Packets$Run.6,level2Packets$Run.7,level2Packets$Run.8,level2Packets$Run.9,level2Packets$Run.10,level2Packets$Run.11,level2Packets$Run.12,level2Packets$Run.13,level2Packets$Run.14,level2Packets$Run.15,level2Packets$Run.16,level2Packets$Run.17,level2Packets$Run.18,level2Packets$Run.19,level2Packets$Run.20), "Optimization.Level"=c(2))
level3PacketsTest <- data.frame('PacketsAll'= c(level3Packets$Run.1,level3Packets$Run.2,level3Packets$Run.3,level3Packets$Run.4,level3Packets$Run.5,level3Packets$Run.6,level3Packets$Run.7,level3Packets$Run.8,level3Packets$Run.9,level3Packets$Run.10,level3Packets$Run.11,level3Packets$Run.12,level3Packets$Run.13,level3Packets$Run.14,level3Packets$Run.15,level3Packets$Run.16,level3Packets$Run.17,level3Packets$Run.18,level3Packets$Run.19,level3Packets$Run.20), "Optimization.Level"=c(3))

#create new variable that contains all values
experimentPackets = rbind(level0PacketsTest, level1PacketsTest, level2PacketsTest, level3PacketsTest)

#remove all the not needed column
#experimentPackets = select(experimentPackets,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentPackets$Optimization.Level = as.factor(experimentPackets$Optimization.Level)

#QQPLOTS for normality
qqnorm(level0PacketsTest$PacketsAll, main="Normal Q-Q Plot of OL0 packets transferred ")
qqline(level0PacketsTest$PacketsAll)

qqnorm(level1PacketsTest$PacketsAll, main="Normal Q-Q Plot of OL1 packets transferred ")
qqline(level1PacketsTest$PacketsAll)

qqnorm(level2PacketsTest$PacketsAll, main="Normal Q-Q Plot of OL2 packets transferred ")
qqline(level2PacketsTest$PacketsAll)

qqnorm(level3PacketsTest$PacketsAll, main="Normal Q-Q Plot of OL3 packets transferred")
qqline(level3PacketsTest$PacketsAll)

#Check for AVONA Assumptions using a Levene's Test for homogeneity of the variance and a test for normality check
shapiro.test(level0PacketsTest$PacketsAll)
shapiro.test(level1PacketsTest$PacketsAll)
shapiro.test(level2PacketsTest$PacketsAll)
shapiro.test(level3PacketsTest$PacketsAll)

kruskal.test(experimentPackets$PacketsAll~experimentPackets$Optimization.Level) #nonparamatric test instead of anova if normality is violated

dunn.test(experimentPackets$PacketsAll, g=experimentPackets$Optimization.Level, method = "bonferroni")

#--------------------------------------------------------------------------------------------------------------------------

#Data for Bytes transferred of the experiments
level0Bytes = read.csv(file="../Aggregate_Metrics3/level0_Results_Bytes.csv", header=TRUE, sep=",")
level1Bytes = read.csv(file="../Aggregate_Metrics3/level1_Results_Bytes.csv", header=TRUE, sep=",")
level2Bytes = read.csv(file="../Aggregate_Metrics3/level2_Results_Bytes.csv", header=TRUE, sep=",")
level3Bytes = read.csv(file="../Aggregate_Metrics3/level3_Results_Bytes.csv", header=TRUE, sep=",")

#create a variable for each OL containing all Runs combined into one column to be able to perform the test on all Runs, and OL as a column
level0BytesTest <- data.frame('BytesAll'= c(level0Bytes$Run.1,level0Bytes$Run.2,level0Bytes$Run.3,level0Bytes$Run.4,level0Bytes$Run.5,level0Bytes$Run.6,level0Bytes$Run.7,level0Bytes$Run.8,level0Bytes$Run.9,level0Bytes$Run.10,level0Bytes$Run.11,level0Bytes$Run.12,level0Bytes$Run.13,level0Bytes$Run.14,level0Bytes$Run.15,level0Bytes$Run.16,level0Bytes$Run.17,level0Bytes$Run.18,level0Bytes$Run.19,level0Bytes$Run.20), "Optimization.Level"=c(0))
level1BytesTest <- data.frame('BytesAll'= c(level1Bytes$Run.1,level1Bytes$Run.2,level1Bytes$Run.3,level1Bytes$Run.4,level1Bytes$Run.5,level1Bytes$Run.6,level1Bytes$Run.7,level1Bytes$Run.8,level1Bytes$Run.9,level1Bytes$Run.10,level1Bytes$Run.11,level1Bytes$Run.12,level1Bytes$Run.13,level1Bytes$Run.14,level1Bytes$Run.15,level1Bytes$Run.16,level1Bytes$Run.17,level1Bytes$Run.18,level1Bytes$Run.19,level1Bytes$Run.20), "Optimization.Level"=c(1))
level2BytesTest <- data.frame('BytesAll'= c(level2Bytes$Run.1,level2Bytes$Run.2,level2Bytes$Run.3,level2Bytes$Run.4,level2Bytes$Run.5,level2Bytes$Run.6,level2Bytes$Run.7,level2Bytes$Run.8,level2Bytes$Run.9,level2Bytes$Run.10,level2Bytes$Run.11,level2Bytes$Run.12,level2Bytes$Run.13,level2Bytes$Run.14,level2Bytes$Run.15,level2Bytes$Run.16,level2Bytes$Run.17,level2Bytes$Run.18,level2Bytes$Run.19,level2Bytes$Run.20), "Optimization.Level"=c(2))
level3BytesTest <- data.frame('BytesAll'= c(level3Bytes$Run.1,level3Bytes$Run.2,level3Bytes$Run.3,level3Bytes$Run.4,level3Bytes$Run.5,level3Bytes$Run.6,level3Bytes$Run.7,level3Bytes$Run.8,level3Bytes$Run.9,level3Bytes$Run.10,level3Bytes$Run.11,level3Bytes$Run.12,level3Bytes$Run.13,level3Bytes$Run.14,level3Bytes$Run.15,level3Bytes$Run.16,level3Bytes$Run.17,level3Bytes$Run.18,level3Bytes$Run.19,level3Bytes$Run.20), "Optimization.Level"=c(3))

#create new variable that contains all values
experimentBytes = rbind(level0BytesTest, level1BytesTest, level2BytesTest, level3BytesTest)

#remove all the not needed column
#experimentBytes = select(experimentBytes,-c(Website,Run.1,Run.2,Run.3,Run.4,Run.5,Run.6,Run.7,Run.8,Run.9,Run.10,Run.11,Run.12,Run.13,Run.14,Run.15,Run.16,Run.17,Run.18,Run.19,Run.20))

#make treatment and webpage columns as a factor to help with the test
experimentBytes$Optimization.Level = as.factor(experimentBytes$Optimization.Level)

#QQPLOTS for normality
qqnorm(level0BytesTest$BytesAll/1024, main="Normal Q-Q Plot of OL0 bytes transferred ")
qqline(level0BytesTest$BytesAll/1024)

qqnorm(level1BytesTest$BytesAll/1024, main="Normal Q-Q Plot of OL1 bytes transferred ")
qqline(level1BytesTest$BytesAll/1024)

qqnorm(level2BytesTest$BytesAll/1024, main="Normal Q-Q Plot of OL2 bytes transferred ")
qqline(level2BytesTest$BytesAll/1024)

qqnorm(level3BytesTest$BytesAll/1024, main="Normal Q-Q Plot of OL3 bytes transferred")
qqline(level3BytesTest$BytesAll/1024)

#Check for AVONA Assumptions using a Levene's Test for homogeneity of the variance and a test for normality check
shapiro.test(level0BytesTest$BytesAll)
shapiro.test(level1BytesTest$BytesAll)
shapiro.test(level2BytesTest$BytesAll)
shapiro.test(level3BytesTest$BytesAll)

kruskal.test(experimentBytes$BytesAll~experimentBytes$Optimization.Level) #nonparamatric test instead of anova if normality is violated

dunn.test(experimentBytes$BytesAll, g=experimentBytes$Optimization.Level, method = "bonferroni")#pairwise comparision to check the mean difference between the groups
