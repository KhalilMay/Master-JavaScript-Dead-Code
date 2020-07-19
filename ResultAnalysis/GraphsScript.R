library(vioplot) # may need installation first
library(goeveg) #may need installation first
#Data for Energy Consumption of the experiments
level0Energy = read.csv(file="../Aggregate_Metrics/level0_Results_Energy.csv", header=TRUE, sep=",")
level1Energy = read.csv(file="../Aggregate_Metrics/level1_Results_Energy.csv", header=TRUE, sep=",")
level2Energy = read.csv(file="../Aggregate_Metrics/level2_Results_Energy.csv", header=TRUE, sep=",")
level3Energy = read.csv(file="../Aggregate_Metrics/level3_Results_Energy.csv", header=TRUE, sep=",")


#Create four variables for each treatment that contains all runs of each subject

level0EnergyAllRuns <- c(level0Energy$Run.1, level0Energy$Run.2, level0Energy$Run.3, level0Energy$Run.4 , level0Energy$Run.5, level0Energy$Run.6, level0Energy$Run.7 ,level0Energy$Run.8, level0Energy$Run.9, level0Energy$Run.10, level0Energy$Run.11, level0Energy$Run.12, level0Energy$Run.13, level0Energy$Run.14, level0Energy$Run.15, level0Energy$Run.16, level0Energy$Run.17, level0Energy$Run.18, level0Energy$Run.19, level0Energy$Run.20)

level1EnergyAllRuns <- c(level1Energy$Run.1, level1Energy$Run.2, level1Energy$Run.3, level1Energy$Run.4 , level1Energy$Run.5, level1Energy$Run.6, level1Energy$Run.7 ,level1Energy$Run.8, level1Energy$Run.9, level1Energy$Run.10, level1Energy$Run.11, level1Energy$Run.12, level1Energy$Run.13, level1Energy$Run.14, level1Energy$Run.15, level1Energy$Run.16, level1Energy$Run.17, level1Energy$Run.18, level1Energy$Run.19, level1Energy$Run.20)

level2EnergyAllRuns <- c(level2Energy$Run.1, level2Energy$Run.2, level2Energy$Run.3, level2Energy$Run.4 , level2Energy$Run.5, level2Energy$Run.6, level2Energy$Run.7 ,level2Energy$Run.8, level2Energy$Run.9, level2Energy$Run.10, level2Energy$Run.11, level2Energy$Run.12, level2Energy$Run.13, level2Energy$Run.14, level2Energy$Run.15, level2Energy$Run.16, level2Energy$Run.17, level2Energy$Run.18, level2Energy$Run.19, level2Energy$Run.20)

level3EnergyAllRuns <- c(level3Energy$Run.1, level3Energy$Run.2, level3Energy$Run.3, level3Energy$Run.4 , level3Energy$Run.5, level3Energy$Run.6, level3Energy$Run.7 ,level3Energy$Run.8, level3Energy$Run.9, level3Energy$Run.10, level3Energy$Run.11, level3Energy$Run.12, level3Energy$Run.13, level3Energy$Run.14, level3Energy$Run.15, level3Energy$Run.16, level3Energy$Run.17, level3Energy$Run.18, level3Energy$Run.19, level3Energy$Run.20)


#vioplot for all runs of enegry for all treatments
energyData = vioplot(level0EnergyAllRuns, level1EnergyAllRuns, level2EnergyAllRuns, level3EnergyAllRuns, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "Energy Consumption (Joules)", main = "Vioplot for the energy consumption of all runs of each treatment")

energyData # includes the median of energy for all OL

#find minimum and maxium of energy for each OL
min(level0EnergyAllRuns)
min(level1EnergyAllRuns)
min(level2EnergyAllRuns)
min(level3EnergyAllRuns)

max(level0EnergyAllRuns)
max(level1EnergyAllRuns)
max(level2EnergyAllRuns)
max(level3EnergyAllRuns)

#average of energy for each OL
mean(level0EnergyAllRuns)
mean(level1EnergyAllRuns)
mean(level2EnergyAllRuns)
mean(level3EnergyAllRuns)

#standard deviation of energy for each OL
sd(level0EnergyAllRuns)
sd(level1EnergyAllRuns)
sd(level2EnergyAllRuns)
sd(level3EnergyAllRuns)

#Coefficient of variation of energy of each OL
cv(level0EnergyAllRuns)
cv(level1EnergyAllRuns)
cv(level2EnergyAllRuns)
cv(level3EnergyAllRuns)

#-----------------------------------------------------------------------------------------------------------------------

#Data for Loading Time of the experiments
level0Loading = read.csv(file="../Aggregate_Metrics2/level0_Results_Load.csv", header=TRUE, sep=",")
level1Loading = read.csv(file="../Aggregate_Metrics2/level1_Results_Load.csv", header=TRUE, sep=",")
level2Loading = read.csv(file="../Aggregate_Metrics2/level2_Results_Load.csv", header=TRUE, sep=",")
level3Loading = read.csv(file="../Aggregate_Metrics2/level3_Results_Load.csv", header=TRUE, sep=",")

#Create four variables for each treatment that contains all runs of each subject

level0LoadingAllRuns <- c(level0Loading$Run.1, level0Loading$Run.2, level0Loading$Run.3, level0Loading$Run.4 , level0Loading$Run.5, level0Loading$Run.6, level0Loading$Run.7 ,level0Loading$Run.8, level0Loading$Run.9, level0Loading$Run.10, level0Loading$Run.11, level0Loading$Run.12, level0Loading$Run.13, level0Loading$Run.14, level0Loading$Run.15, level0Loading$Run.16, level0Loading$Run.17, level0Loading$Run.18, level0Loading$Run.19, level0Loading$Run.20)

level1LoadingAllRuns <- c(level1Loading$Run.1, level1Loading$Run.2, level1Loading$Run.3, level1Loading$Run.4 , level1Loading$Run.5, level1Loading$Run.6, level1Loading$Run.7 ,level1Loading$Run.8, level1Loading$Run.9, level1Loading$Run.10, level1Loading$Run.11, level1Loading$Run.12, level1Loading$Run.13, level1Loading$Run.14, level1Loading$Run.15, level1Loading$Run.16, level1Loading$Run.17, level1Loading$Run.18, level1Loading$Run.19, level1Loading$Run.20)

level2LoadingAllRuns <- c(level2Loading$Run.1, level2Loading$Run.2, level2Loading$Run.3, level2Loading$Run.4 , level2Loading$Run.5, level2Loading$Run.6, level2Loading$Run.7 ,level2Loading$Run.8, level2Loading$Run.9, level2Loading$Run.10, level2Loading$Run.11, level2Loading$Run.12, level2Loading$Run.13, level2Loading$Run.14, level2Loading$Run.15, level2Loading$Run.16, level2Loading$Run.17, level2Loading$Run.18, level2Loading$Run.19, level2Loading$Run.20)

level3LoadingAllRuns <- c(level3Loading$Run.1, level3Loading$Run.2, level3Loading$Run.3, level3Loading$Run.4 , level3Loading$Run.5, level3Loading$Run.6, level3Loading$Run.7 ,level3Loading$Run.8, level3Loading$Run.9, level3Loading$Run.10, level3Loading$Run.11, level3Loading$Run.12, level3Loading$Run.13, level3Loading$Run.14, level3Loading$Run.15, level3Loading$Run.16, level3Loading$Run.17, level3Loading$Run.18, level3Loading$Run.19, level3Loading$Run.20)


#vioplot for total average of loading time for all treatments
loadData = vioplot(level0LoadingAllRuns, level1LoadingAllRuns, level2LoadingAllRuns, level3LoadingAllRuns, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "Load Time Values(ms)", main = "Vioplot for the Loading Time of all runs of each treatment")

loadData # includes the median of loading for each OL

#find minimum and maxium of loading for each OL
min(level0LoadingAllRuns)
min(level1LoadingAllRuns)
min(level2LoadingAllRuns)
min(level3LoadingAllRuns)

max(level0LoadingAllRuns)
max(level1LoadingAllRuns)
max(level2LoadingAllRuns)
max(level3LoadingAllRuns)

#average of loading for each OL
mean(level0LoadingAllRuns)
mean(level1LoadingAllRuns)
mean(level2LoadingAllRuns)
mean(level3LoadingAllRuns)

#standard deviation of loading for each OL
sd(level0LoadingAllRuns)
sd(level1LoadingAllRuns)
sd(level2LoadingAllRuns)
sd(level3LoadingAllRuns)

#Coefficient of variation of loading of each OL
cv(level0LoadingAllRuns)
cv(level1LoadingAllRuns)
cv(level2LoadingAllRuns)
cv(level3LoadingAllRuns)
#------------------------------------------------------------------------------------------------------------------------

#Data for CPU of the experiments
level0CPU = read.csv(file="../Aggregate_Metrics/level0_Results_CPU.csv", header=TRUE, sep=",")
level1CPU = read.csv(file="../Aggregate_Metrics/level1_Results_CPU.csv", header=TRUE, sep=",")
level2CPU = read.csv(file="../Aggregate_Metrics/level2_Results_CPU.csv", header=TRUE, sep=",")
level3CPU = read.csv(file="../Aggregate_Metrics/level3_Results_CPU.csv", header=TRUE, sep=",")

#Create four variables for each treatment that contains all runs of each subject

level0CPUAllRuns <- c(level0CPU$Run.1, level0CPU$Run.2, level0CPU$Run.3, level0CPU$Run.4 , level0CPU$Run.5, level0CPU$Run.6, level0CPU$Run.7 ,level0CPU$Run.8, level0CPU$Run.9, level0CPU$Run.10, level0CPU$Run.11, level0CPU$Run.12, level0CPU$Run.13, level0CPU$Run.14, level0CPU$Run.15, level0CPU$Run.16, level0CPU$Run.17, level0CPU$Run.18, level0CPU$Run.19, level0CPU$Run.20)

level1CPUAllRuns <- c(level1CPU$Run.1, level1CPU$Run.2, level1CPU$Run.3, level1CPU$Run.4 , level1CPU$Run.5, level1CPU$Run.6, level1CPU$Run.7 ,level1CPU$Run.8, level1CPU$Run.9, level1CPU$Run.10, level1CPU$Run.11, level1CPU$Run.12, level1CPU$Run.13, level1CPU$Run.14, level1CPU$Run.15, level1CPU$Run.16, level1CPU$Run.17, level1CPU$Run.18, level1CPU$Run.19, level1CPU$Run.20)

level2CPUAllRuns <- c(level2CPU$Run.1, level2CPU$Run.2, level2CPU$Run.3, level2CPU$Run.4 , level2CPU$Run.5, level2CPU$Run.6, level2CPU$Run.7 ,level2CPU$Run.8, level2CPU$Run.9, level2CPU$Run.10, level2CPU$Run.11, level2CPU$Run.12, level2CPU$Run.13, level2CPU$Run.14, level2CPU$Run.15, level2CPU$Run.16, level2CPU$Run.17, level2CPU$Run.18, level2CPU$Run.19, level2CPU$Run.20)

level3CPUAllRuns <- c(level3CPU$Run.1, level3CPU$Run.2, level3CPU$Run.3, level3CPU$Run.4 , level3CPU$Run.5, level3CPU$Run.6, level3CPU$Run.7 ,level3CPU$Run.8, level3CPU$Run.9, level3CPU$Run.10, level3CPU$Run.11, level3CPU$Run.12, level3CPU$Run.13, level3CPU$Run.14, level3CPU$Run.15, level3CPU$Run.16, level3CPU$Run.17, level3CPU$Run.18, level3CPU$Run.19, level3CPU$Run.20)


#vioplot for total average of cpu usage for all treatments
cpuData= vioplot(level0CPUAllRuns, level1CPUAllRuns, level2CPUAllRuns, level3CPUAllRuns, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "CPU Usage(%)", main = "Vioplot for the CPU Usage of all runs of each treatment")

cpuData# includes the median of CPU for all OL

#find minimum and maxium of cpu for each OL
min(level0CPUAllRuns)
min(level1CPUAllRuns)
min(level2CPUAllRuns)
min(level3CPUAllRuns)

max(level0CPUAllRuns)
max(level1CPUAllRuns)
max(level2CPUAllRuns)
max(level3CPUAllRuns)

#average of cpu for each OL
mean(level0CPUAllRuns)
mean(level1CPUAllRuns)
mean(level2CPUAllRuns)
mean(level3CPUAllRuns)

#standard deviation of cpu for each OL
sd(level0CPUAllRuns)
sd(level1CPUAllRuns)
sd(level2CPUAllRuns)
sd(level3CPUAllRuns)

#Coefficient of variation of cpu of each OL
cv(level0CPUAllRuns)
cv(level1CPUAllRuns)
cv(level2CPUAllRuns)
cv(level3CPUAllRuns)
#-------------------------------------------------------------------------------------------------------------------------------

#Data for Memory of the experiments
level0Memory = read.csv(file="../Aggregate_Metrics/level0_Results_Memory.csv", header=TRUE, sep=",")
level1Memory = read.csv(file="../Aggregate_Metrics/level1_Results_Memory.csv", header=TRUE, sep=",")
level2Memory = read.csv(file="../Aggregate_Metrics/level2_Results_Memory.csv", header=TRUE, sep=",")
level3Memory = read.csv(file="../Aggregate_Metrics/level3_Results_Memory.csv", header=TRUE, sep=",")

#Create four variables for each treatment that contains all runs of each subject

level0MemoryAllRuns <- c(level0Memory$Run.1, level0Memory$Run.2, level0Memory$Run.3, level0Memory$Run.4 , level0Memory$Run.5, level0Memory$Run.6, level0Memory$Run.7 ,level0Memory$Run.8, level0Memory$Run.9, level0Memory$Run.10, level0Memory$Run.11, level0Memory$Run.12, level0Memory$Run.13, level0Memory$Run.14, level0Memory$Run.15, level0Memory$Run.16, level0Memory$Run.17, level0Memory$Run.18, level0Memory$Run.19, level0Memory$Run.20)

level1MemoryAllRuns <- c(level1Memory$Run.1, level1Memory$Run.2, level1Memory$Run.3, level1Memory$Run.4 , level1Memory$Run.5, level1Memory$Run.6, level1Memory$Run.7 ,level1Memory$Run.8, level1Memory$Run.9, level1Memory$Run.10, level1Memory$Run.11, level1Memory$Run.12, level1Memory$Run.13, level1Memory$Run.14, level1Memory$Run.15, level1Memory$Run.16, level1Memory$Run.17, level1Memory$Run.18, level1Memory$Run.19, level1Memory$Run.20)

level2MemoryAllRuns <- c(level2Memory$Run.1, level2Memory$Run.2, level2Memory$Run.3, level2Memory$Run.4 , level2Memory$Run.5, level2Memory$Run.6, level2Memory$Run.7 ,level2Memory$Run.8, level2Memory$Run.9, level2Memory$Run.10, level2Memory$Run.11, level2Memory$Run.12, level2Memory$Run.13, level2Memory$Run.14, level2Memory$Run.15, level2Memory$Run.16, level2Memory$Run.17, level2Memory$Run.18, level2Memory$Run.19, level2Memory$Run.20)

level3MemoryAllRuns <- c(level3Memory$Run.1, level3Memory$Run.2, level3Memory$Run.3, level3Memory$Run.4 , level3Memory$Run.5, level3Memory$Run.6, level3Memory$Run.7 ,level3Memory$Run.8, level3Memory$Run.9, level3Memory$Run.10, level3Memory$Run.11, level3Memory$Run.12, level3Memory$Run.13, level3Memory$Run.14, level3Memory$Run.15, level3Memory$Run.16, level3Memory$Run.17, level3Memory$Run.18, level3Memory$Run.19, level3Memory$Run.20)



#vioplot for total average of memory consumption for all treatments
memData = vioplot(level0MemoryAllRuns/1024, level1MemoryAllRuns/1024, level2MemoryAllRuns/1024, level3MemoryAllRuns/1024, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "Memory Consumption(MB)", main = "Vioplot for the Memory consumption of all runs of each treatment")


memData # includes the median of memory for all OL

#find minimum and maxium of memory for each OL
min(level0MemoryAllRuns/1024)
min(level1MemoryAllRuns/1024)
min(level2MemoryAllRuns/1024)
min(level3MemoryAllRuns/1024)

max(level0MemoryAllRuns/1024)
max(level1MemoryAllRuns/1024)
max(level2MemoryAllRuns/1024)
max(level3MemoryAllRuns/1024)

#average of memory for each OL
mean(level0MemoryAllRuns/1024)
mean(level1MemoryAllRuns/1024)
mean(level2MemoryAllRuns/1024)
mean(level3MemoryAllRuns/1024)

#standard deviation of memory for each OL
sd(level0MemoryAllRuns/1024)
sd(level1MemoryAllRuns/1024)
sd(level2MemoryAllRuns/1024)
sd(level3MemoryAllRuns/1024)

#Coefficient of variation of memory of each OL
cv(level0MemoryAllRuns/1024)
cv(level1MemoryAllRuns/1024)
cv(level2MemoryAllRuns/1024)
cv(level3MemoryAllRuns/1024)

#-----------------------

#Data for FP of the experiments
level0FP = read.csv(file="../Aggregate_Metrics2/level0_Results_Fp.csv", header=TRUE, sep=",")
level1FP = read.csv(file="../Aggregate_Metrics2/level1_Results_Fp.csv", header=TRUE, sep=",")
level2FP = read.csv(file="../Aggregate_Metrics2/level2_Results_Fp.csv", header=TRUE, sep=",")
level3FP = read.csv(file="../Aggregate_Metrics2/level3_Results_Fp.csv", header=TRUE, sep=",")

#Create four variables for each treatment that contains all runs of each subject

level0FPAllRuns <- c(level0FP$Run.1, level0FP$Run.2, level0FP$Run.3, level0FP$Run.4 , level0FP$Run.5, level0FP$Run.6, level0FP$Run.7 ,level0FP$Run.8, level0FP$Run.9, level0FP$Run.10, level0FP$Run.11, level0FP$Run.12, level0FP$Run.13, level0FP$Run.14, level0FP$Run.15, level0FP$Run.16, level0FP$Run.17, level0FP$Run.18, level0FP$Run.19, level0FP$Run.20)

level1FPAllRuns <- c(level1FP$Run.1, level1FP$Run.2, level1FP$Run.3, level1FP$Run.4 , level1FP$Run.5, level1FP$Run.6, level1FP$Run.7 ,level1FP$Run.8, level1FP$Run.9, level1FP$Run.10, level1FP$Run.11, level1FP$Run.12, level1FP$Run.13, level1FP$Run.14, level1FP$Run.15, level1FP$Run.16, level1FP$Run.17, level1FP$Run.18, level1FP$Run.19, level1FP$Run.20)

level2FPAllRuns <- c(level2FP$Run.1, level2FP$Run.2, level2FP$Run.3, level2FP$Run.4 , level2FP$Run.5, level2FP$Run.6, level2FP$Run.7 ,level2FP$Run.8, level2FP$Run.9, level2FP$Run.10, level2FP$Run.11, level2FP$Run.12, level2FP$Run.13, level2FP$Run.14, level2FP$Run.15, level2FP$Run.16, level2FP$Run.17, level2FP$Run.18, level2FP$Run.19, level2FP$Run.20)

level3FPAllRuns <- c(level3FP$Run.1, level3FP$Run.2, level3FP$Run.3, level3FP$Run.4 , level3FP$Run.5, level3FP$Run.6, level3FP$Run.7 ,level3FP$Run.8, level3FP$Run.9, level3FP$Run.10, level3FP$Run.11, level3FP$Run.12, level3FP$Run.13, level3FP$Run.14, level3FP$Run.15, level3FP$Run.16, level3FP$Run.17, level3FP$Run.18, level3FP$Run.19, level3FP$Run.20)


#vioplot for total average of FP time for all treatments
FPData = vioplot(level0FPAllRuns, level1FPAllRuns, level2FPAllRuns, level3FPAllRuns, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "FP Values(ms)", main = "Vioplot for the FP of all runs of each treatment")

FPData #includes median of FP for all OL

#find minimum and maxium of fp for each OL
min(level0FPAllRuns)
min(level1FPAllRuns)
min(level2FPAllRuns)
min(level3FPAllRuns)

max(level0FPAllRuns)
max(level1FPAllRuns)
max(level2FPAllRuns)
max(level3FPAllRuns)

#average of fp for each OL
mean(level0FPAllRuns)
mean(level1FPAllRuns)
mean(level2FPAllRuns)
mean(level3FPAllRuns)

#standard deviation of fp for each OL
sd(level0FPAllRuns)
sd(level1FPAllRuns)
sd(level2FPAllRuns)
sd(level3FPAllRuns)

#Coefficient of variation of fp of each OL
cv(level0FPAllRuns)
cv(level1FPAllRuns)
cv(level2FPAllRuns)
cv(level3FPAllRuns)

#-----------------------

#Data for FCP of the experiments
level0FCP = read.csv(file="../Aggregate_Metrics2/level0_Results_Fcp.csv", header=TRUE, sep=",")
level1FCP = read.csv(file="../Aggregate_Metrics2/level1_Results_Fcp.csv", header=TRUE, sep=",")
level2FCP = read.csv(file="../Aggregate_Metrics2/level2_Results_Fcp.csv", header=TRUE, sep=",")
level3FCP = read.csv(file="../Aggregate_Metrics2/level3_Results_Fcp.csv", header=TRUE, sep=",")

#Create four variables for each treatment that contains all runs of each subject

level0FCPAllRuns <- c(level0FCP$Run.1, level0FCP$Run.2, level0FCP$Run.3, level0FCP$Run.4 , level0FCP$Run.5, level0FCP$Run.6, level0FCP$Run.7 ,level0FCP$Run.8, level0FCP$Run.9, level0FCP$Run.10, level0FCP$Run.11, level0FCP$Run.12, level0FCP$Run.13, level0FCP$Run.14, level0FCP$Run.15, level0FCP$Run.16, level0FCP$Run.17, level0FCP$Run.18, level0FCP$Run.19, level0FCP$Run.20)

level1FCPAllRuns <- c(level1FCP$Run.1, level1FCP$Run.2, level1FCP$Run.3, level1FCP$Run.4 , level1FCP$Run.5, level1FCP$Run.6, level1FCP$Run.7 ,level1FCP$Run.8, level1FCP$Run.9, level1FCP$Run.10, level1FCP$Run.11, level1FCP$Run.12, level1FCP$Run.13, level1FCP$Run.14, level1FCP$Run.15, level1FCP$Run.16, level1FCP$Run.17, level1FCP$Run.18, level1FCP$Run.19, level1FCP$Run.20)

level2FCPAllRuns <- c(level2FCP$Run.1, level2FCP$Run.2, level2FCP$Run.3, level2FCP$Run.4 , level2FCP$Run.5, level2FCP$Run.6, level2FCP$Run.7 ,level2FCP$Run.8, level2FCP$Run.9, level2FCP$Run.10, level2FCP$Run.11, level2FCP$Run.12, level2FCP$Run.13, level2FCP$Run.14, level2FCP$Run.15, level2FCP$Run.16, level2FCP$Run.17, level2FCP$Run.18, level2FCP$Run.19, level2FCP$Run.20)

level3FCPAllRuns <- c(level3FCP$Run.1, level3FCP$Run.2, level3FCP$Run.3, level3FCP$Run.4 , level3FCP$Run.5, level3FCP$Run.6, level3FCP$Run.7 ,level3FCP$Run.8, level3FCP$Run.9, level3FCP$Run.10, level3FCP$Run.11, level3FCP$Run.12, level3FCP$Run.13, level3FCP$Run.14, level3FCP$Run.15, level3FCP$Run.16, level3FCP$Run.17, level3FCP$Run.18, level3FCP$Run.19, level3FCP$Run.20)


#vioplot for total average of FCP time for all treatments
fcpData = vioplot(level0FCPAllRuns, level1FCPAllRuns, level2FCPAllRuns, level3FCPAllRuns, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "FCP Values(ms)", main = "Vioplot for the FCP of all runs of each treatment")

fcpData #includes median of fcp for all OL

#find minimum and maxium of fcp for each OL
min(level0FCPAllRuns)
min(level1FCPAllRuns)
min(level2FCPAllRuns)
min(level3FCPAllRuns)

max(level0FCPAllRuns)
max(level1FCPAllRuns)
max(level2FCPAllRuns)
max(level3FCPAllRuns)

#average of fcp for each OL
mean(level0FCPAllRuns)
mean(level1FCPAllRuns)
mean(level2FCPAllRuns)
mean(level3FCPAllRuns)

#standard deviation of fcp for each OL
sd(level0FCPAllRuns)
sd(level1FCPAllRuns)
sd(level2FCPAllRuns)
sd(level3FCPAllRuns)

#Coefficient of variation of fcp of each OL
cv(level0FCPAllRuns)
cv(level1FCPAllRuns)
cv(level2FCPAllRuns)
cv(level3FCPAllRuns)

#-----------------------

#Data for packet of the experiments
level0Packets = read.csv(file="../Aggregate_Metrics3/level0_Results_Packets.csv", header=TRUE, sep=",")
level1Packets = read.csv(file="../Aggregate_Metrics3/level1_Results_Packets.csv", header=TRUE, sep=",")
level2Packets = read.csv(file="../Aggregate_Metrics3/level2_Results_Packets.csv", header=TRUE, sep=",")
level3Packets = read.csv(file="../Aggregate_Metrics3/level3_Results_Packets.csv", header=TRUE, sep=",")

#Create four variables for each treatment that contains all runs of each subject

level0PacketsAllRuns <- c(level0Packets$Run.1, level0Packets$Run.2, level0Packets$Run.3, level0Packets$Run.4 , level0Packets$Run.5, level0Packets$Run.6, level0Packets$Run.7 ,level0Packets$Run.8, level0Packets$Run.9, level0Packets$Run.10, level0Packets$Run.11, level0Packets$Run.12, level0Packets$Run.13, level0Packets$Run.14, level0Packets$Run.15, level0Packets$Run.16, level0Packets$Run.17, level0Packets$Run.18, level0Packets$Run.19, level0Packets$Run.20)

level1PacketsAllRuns <- c(level1Packets$Run.1, level1Packets$Run.2, level1Packets$Run.3, level1Packets$Run.4 , level1Packets$Run.5, level1Packets$Run.6, level1Packets$Run.7 ,level1Packets$Run.8, level1Packets$Run.9, level1Packets$Run.10, level1Packets$Run.11, level1Packets$Run.12, level1Packets$Run.13, level1Packets$Run.14, level1Packets$Run.15, level1Packets$Run.16, level1Packets$Run.17, level1Packets$Run.18, level1Packets$Run.19, level1Packets$Run.20)

level2PacketsAllRuns <- c(level2Packets$Run.1, level2Packets$Run.2, level2Packets$Run.3, level2Packets$Run.4 , level2Packets$Run.5, level2Packets$Run.6, level2Packets$Run.7 ,level2Packets$Run.8, level2Packets$Run.9, level2Packets$Run.10, level2Packets$Run.11, level2Packets$Run.12, level2Packets$Run.13, level2Packets$Run.14, level2Packets$Run.15, level2Packets$Run.16, level2Packets$Run.17, level2Packets$Run.18, level2Packets$Run.19, level2Packets$Run.20)

level3PacketsAllRuns <- c(level3Packets$Run.1, level3Packets$Run.2, level3Packets$Run.3, level3Packets$Run.4 , level3Packets$Run.5, level3Packets$Run.6, level3Packets$Run.7 ,level3Packets$Run.8, level3Packets$Run.9, level3Packets$Run.10, level3Packets$Run.11, level3Packets$Run.12, level3Packets$Run.13, level3Packets$Run.14, level3Packets$Run.15, level3Packets$Run.16, level3Packets$Run.17, level3Packets$Run.18, level3Packets$Run.19, level3Packets$Run.20)


#vioplot for total average of Packets time for all treatments
packetData = vioplot(level0PacketsAllRuns, level1PacketsAllRuns, level2PacketsAllRuns, level3PacketsAllRuns, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "Number of Packets", main = "Vioplot for the Packets of all runs of each treatment")

packetData# includes median of packets for all OL

#find minimum and maxium of packets for each OL
min(level0PacketsAllRuns)
min(level1PacketsAllRuns)
min(level2PacketsAllRuns)
min(level3PacketsAllRuns)

max(level0PacketsAllRuns)
max(level1PacketsAllRuns)
max(level2PacketsAllRuns)
max(level3PacketsAllRuns)

#average of packets for each OL
mean(level0PacketsAllRuns)
mean(level1PacketsAllRuns)
mean(level2PacketsAllRuns)
mean(level3PacketsAllRuns)

#standard deviation of packets for each OL
sd(level0PacketsAllRuns)
sd(level1PacketsAllRuns)
sd(level2PacketsAllRuns)
sd(level3PacketsAllRuns)

#Coefficient of variation of packets of each OL
cv(level0PacketsAllRuns)
cv(level1PacketsAllRuns)
cv(level2PacketsAllRuns)
cv(level3PacketsAllRuns)

#-----------------------

#Data for bytes of the experiments
level0Bytes = read.csv(file="../Aggregate_Metrics3/level0_Results_Bytes.csv", header=TRUE, sep=",")
level1Bytes = read.csv(file="../Aggregate_Metrics3/level1_Results_Bytes.csv", header=TRUE, sep=",")
level2Bytes = read.csv(file="../Aggregate_Metrics3/level2_Results_Bytes.csv", header=TRUE, sep=",")
level3Bytes = read.csv(file="../Aggregate_Metrics3/level3_Results_Bytes.csv", header=TRUE, sep=",")

#Create four variables for each treatment that contains all runs of each subject

level0BytesAllRuns <- c(level0Bytes$Run.1, level0Bytes$Run.2, level0Bytes$Run.3, level0Bytes$Run.4 , level0Bytes$Run.5, level0Bytes$Run.6, level0Bytes$Run.7 ,level0Bytes$Run.8, level0Bytes$Run.9, level0Bytes$Run.10, level0Bytes$Run.11, level0Bytes$Run.12, level0Bytes$Run.13, level0Bytes$Run.14, level0Bytes$Run.15, level0Bytes$Run.16, level0Bytes$Run.17, level0Bytes$Run.18, level0Bytes$Run.19, level0Bytes$Run.20)

level1BytesAllRuns <- c(level1Bytes$Run.1, level1Bytes$Run.2, level1Bytes$Run.3, level1Bytes$Run.4 , level1Bytes$Run.5, level1Bytes$Run.6, level1Bytes$Run.7 ,level1Bytes$Run.8, level1Bytes$Run.9, level1Bytes$Run.10, level1Bytes$Run.11, level1Bytes$Run.12, level1Bytes$Run.13, level1Bytes$Run.14, level1Bytes$Run.15, level1Bytes$Run.16, level1Bytes$Run.17, level1Bytes$Run.18, level1Bytes$Run.19, level1Bytes$Run.20)

level2BytesAllRuns <- c(level2Bytes$Run.1, level2Bytes$Run.2, level2Bytes$Run.3, level2Bytes$Run.4 , level2Bytes$Run.5, level2Bytes$Run.6, level2Bytes$Run.7 ,level2Bytes$Run.8, level2Bytes$Run.9, level2Bytes$Run.10, level2Bytes$Run.11, level2Bytes$Run.12, level2Bytes$Run.13, level2Bytes$Run.14, level2Bytes$Run.15, level2Bytes$Run.16, level2Bytes$Run.17, level2Bytes$Run.18, level2Bytes$Run.19, level2Bytes$Run.20)

level3BytesAllRuns <- c(level3Bytes$Run.1, level3Bytes$Run.2, level3Bytes$Run.3, level3Bytes$Run.4 , level3Bytes$Run.5, level3Bytes$Run.6, level3Bytes$Run.7 ,level3Bytes$Run.8, level3Bytes$Run.9, level3Bytes$Run.10, level3Bytes$Run.11, level3Bytes$Run.12, level3Bytes$Run.13, level3Bytes$Run.14, level3Bytes$Run.15, level3Bytes$Run.16, level3Bytes$Run.17, level3Bytes$Run.18, level3Bytes$Run.19, level3Bytes$Run.20)


#vioplot for total average of Bytes time for all treatments
byteData = vioplot(level0BytesAllRuns/1024, level1BytesAllRuns/1024, level2BytesAllRuns/1024, level3BytesAllRuns/1024, names = c("OL0", "OL1", "OL2", "OL3"), xlab = "Treatment Type", ylab = "Number of KiloBytes Transferred(KB)", main = "Vioplot for the KiloBytes Transferred of all runs of each treatment")
#The values are converted to KB to have smaller values

byteData# includes median of bytes for all OL

#find minimum and maxium of bytes for each OL
min(level0BytesAllRuns/1024)
min(level1BytesAllRuns/1024)
min(level2BytesAllRuns/1024)
min(level3BytesAllRuns/1024)

max(level0BytesAllRuns/1024)
max(level1BytesAllRuns/1024)
max(level2BytesAllRuns/1024)
max(level3BytesAllRuns/1024)

#average of bytes for each OL
mean(level0BytesAllRuns/1024)
mean(level1BytesAllRuns/1024)
mean(level2BytesAllRuns/1024)
mean(level3BytesAllRuns/1024)

#standard deviation of bytes for each OL
sd(level0BytesAllRuns/1024)
sd(level1BytesAllRuns/1024)
sd(level2BytesAllRuns/1024)
sd(level3BytesAllRuns/1024)

#Coefficient of variation of bytes of each OL
cv(level0BytesAllRuns/1024)
cv(level1BytesAllRuns/1024)
cv(level2BytesAllRuns/1024)
cv(level3BytesAllRuns/1024)
