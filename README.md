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

For Mitmproxy, check [HERE](https://docs.mitmproxy.org/stable/overview-installation/) (`pip install mitmproxy`)

For LacunaV2, the installation are present in the the `node_modules` directory, otherwise check [HERE](https://github.com/Kishanjay/LacunaV2)

## Setup
Some commands will overwrite the current available files and folders. Check if the steps are already made before executing the following commands.

### Create the three additional variants for each web page subject
The `subjects` directory includes all variants of 20 subjects, and `lacunaWebPages` directory includes all variants of the other 16 subjects. The command below is already excuted for all optimization levels of lacunaV2. 

```bash
# Apply javascript removal for angularjs_require subject using analyzers dynamic and tajs and using optimization level 2
node LacunaV2-master/lacuna ./subjects/lvl0/angularjs_require -a tajs dynamic -o 2 -d ./subjects/lvl2/angularjs_require -f
```

### Add Javascript snippet to each web page subject
This command is executed for all variants of the subjects in `lacunaWebPage` and `subjects` directory (The JS snippet has been already added to the subjects within this repository)

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

To collect details of the packets transferred for each run of each subject, execute the command below as well as adding a proxy to the network that the mobile device used for this experiment is connected to. Make sure that the port used for the proxy in the mobile device is the same as the one used in the command below
```bash
# run mitmproxy on port 8080 and save the flow file in a text file such as flowFileName
mitmproxy -p 8080 --set save_stream_file=flowFileName
```


To collect Loading Time metric and the various metrics collected by perfumejs, execute the following command that collects and saves the various metrics in the directory `output`
```bash
# run a server on port 8081
python listener.py
```

Then the androidrunner experiment executer can be executed using a config file. Make sure that the paths to monkeyrunner and systrace in the config file used to point to their respective location on your machine.
```bash
# config we used is in location android-runner-master/examples/batterystats/config_web.json
python3 android-runner-master path/to/config
```

## Aggregate Metrics Results
To be able to analyze the results of the metrics collected. we need to aggregate the results for each variant of each metric into a seperate csv file. The command below aggregates the results of batterystats metrics placed within the `/android-runner-master/examples/batterystats/output/` directory

```bash
# aggregate energy consumption, memory consumption, cpu usage within the given directory
python aggregate_results.py path/to/batterystatsOutput
```

The command below aggregates the results for the loading time and perfumejs metrics placed within the `output` directory

```bash
# aggregate Loading time, starting time, fp, fcp within the given directory
python aggregate_results2.py path/to/outputDirectory
```


To aggregate the mitmproxy results, first we need to convert the flow text file(s) generated into a csv file(s). If the experiment had multiple text flow files execute the following command for each file

```bash
# Convert the text flow file into csv file
python logfileToCSV.py flowFileName flowFileName.csv
```

Now, to aggregate the mitmproxy results make sure that the loading time and perfumejs metrics are aggregated first. The reason for this is because aggregating mitmproxy results uses the starting time of each run which is aggregated with the loading and perfumejs metrics in directory `Aggregate_Metrics2`. 

The command below aggregates the mitmproxy results presents within a directory with ONLY the CSV flow files such as `mitmproxyResults/CSVFiles` and given the directory `Aggregate_Metrics2` with the starting time aggregated.

```bash
# aggregate packets transferred and bytes transferred within the given CSVFiles directory and the aggregated starting time directory
python aggregate_mitmproxy.py path/to/CSVFlowFiles path/to/Aggregated_Metrics2
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

## Results for our experiment
The output files of our experiment are in the following directories

* Energy consumption, Memory consumption and CPU usage output are in the directory `/android-runner-master/examples/batterystats/output/2020.05.30_055428/data/j7duo/`
* Loading Time, FP and FCP are in the directory `output/`
* Mitmproxy CSV Files are zipped in the directory `mitmproxyResults/`
* Mitmproxy text Files are too large to push into this repository, however you can find a zipped folder [Here](https://drive.google.com/file/d/1ry2WJeq3O5s7wF0BB6SR5XxPWuETeew1/view?usp=sharing)
* Aggregated results of energy , memory, and cpu are in the directory `Aggregate_Metrics/`
* Aggregated results of Loading, Starting , FP and FCP are in the directory `Aggregate_Metrics2/`
* Aggregated results of packets and bytes transferred are in the directory `Aggregate_Metrics3/`
