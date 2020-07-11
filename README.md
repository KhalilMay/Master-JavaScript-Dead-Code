# Dead Javascript Code Removal Experiment
This github repository includes the code needed to replicate the experiment on dead JavaScript code removal using [LacunaV2 tool](https://github.com/Kishanjay/LacunaV2). The aim of this experiment is inspect the impact of dead javascript code on the energy consumption and various performance metrics of mobile web applications. The various performance metrics includes Loading Time, memory consumption, cpu usage, first paint, first contentful paint, bytes transferred and packets transferred. The repository also includes the result of the experiment we already performed.

### Required software
* [Http-server](https://www.npmjs.com/package/http-server)(`npm install http-server`)
* [Pluginbase](https://pypi.org/project/pluginbase/)(`pip install pluginbase`)
* [BeautifulSoup](https://pypi.org/project/beautifulsoup4/)(`pip install beautifulsoup4`)

For [AndroidRunner](https://github.com/S2-group/android-runner):
* [Python 3](https://www.python.org/downloads/)
* [Android Debug Bridge](https://developer.android.com/studio/command-line/adb)(`sudo apt install android-tools-adb`)
* [Android SDK Tools](https://developer.android.com/studio/test/monkeyrunner)(`sudo apt install monkeyrunner`) 
* [JDK 8(NOT JDK 9)](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)(`sudo apt install openjdk-8-jre`)
* [lxml](https://lxml.de/installation.html)(`sudo apt install python-lxml`)

For Mitmproxy check [HERE](https://docs.mitmproxy.org/stable/overview-installation/)

For LacunaV2 the installation are present in the the `node_modules` directory, otherwise check [HERE](https://github.com/Kishanjay/LacunaV2)

## Setup
Some commands will overwrite the current available files and folders. Check if the steps are already made before executing the following commands.

### Create the three additional variants for each web page subject
The `subjects` directory includes all variants of 20 subjects, and `lacunaWebPages` directory includes all variants of the other 16 subjects. The command below is already excuted for all optimization levels of lacunaV2. 

```bash
# Apply javascript removal for angularjs_require subject using analyzers dynamic and tajs and using optimization level 2
node LacunaV2-master/lacuna ./subjects/lvl0/angularjs_require -a tajs dynamic -o 2 -d ./subjects/lvl2/angularjs_require -f
```

### Add Javascript snippet to each web page subject
This command is executed for all variants of the subjects in `lacunaWebPage` and `subjects` directory

```bash
python3 AddJS.py
```

## Run the experiments

To host a website on the machine, execute the following command in the directory were you have `subjects` and `lacunaWebPages`:
```bash
# Hosting the current project or directory on port 2020
http-server -p 2020
```

To be able to access the localhost websites on the mobile device:
```bash
# Enter the portnumber that the websites are hosted on
adb reverse tcp:2020 tcp:2020
```

Then the androidrunner experiment executer can be executed using a config file. Make sure that the paths to monkeyrunner and systrace in the config file used to point to their respective location on your machine.
```bash
# config we used is in location android-runner-master/examples/batterystats/config_web.json
python3 android-runner-master path/to/config
```

## Statistical & Graphical Analysis
Before generating the plots and performing statistical tests, some libraries needs to be installed. Using the console of RStudio execute the following commands

```bash
install.packages("dplyr")
install.packages("vioplot")
install.packages("car")
```

To generate the plots and execute the statistical tests, open the file and run their codes using Rstudio or run the following commands

```bash
Rscript ResultAnalysis/AnalysisScript.R
Rscript ResultAnalysis/GraphScript.R
```
