import sys
import ast
from datetime import datetime
import csv
import paths
import time

def main(device, *args, **kwargs):
    print('=INTERACTION=')
    print("Waiting for log...")
    #results = {}
    #navigationTime= {'fetchTime':0 , 'workerTime':0 , 'totalTime':0, 'downloadTime':0, 'timeToFirstByte':0, 'headerSize':0, 'dnsLookupTime': 0}
    #networkInf = {'downlink': 0, 'effectiveType': 0, 'rtt':0, 'saveData':False}
    #storageEstimate = {'quota':0, 'usage':0, 'caches':0, 'indexedDB': 0, 'serviceWorker': 0}
    #logcat_output = device.logcat_regex("Lacuna:").splitlines()
    #print(logcat_output)
    #for x in logcat_output:
        #if 'Load' in str(x,'utf-8'):
            #x= str(x,'utf-8')
            #results = eval("{"+ x.split("Lacuna:{")[1].split(", \'Perfume")[0]+ "}")

            #if 'navigationTiming' in x:
               #navigationTime['fetchTime'] = x.split("fetchTime\":")[1].split(",\"workerTime")[0]
               #navigationTime['workerTime'] = x.split("workerTime\":")[1].split(",\"totalTime")[0]
               #navigationTime['totalTime'] = x.split("totalTime\":")[1].split(",\"downloadTime")[0]
               #navigationTime['downloadTime'] = x.split("downloadTime\":")[1].split(",\"timeToFirstByte")[0]
               #navigationTime['timeToFirstByte'] = x.split("timeToFirstByte\":")[1].split(",\"headerSize")[0]
               #navigationTime['headerSize'] = x.split("headerSize\":")[1].split(",\"dnsLookupTime")[0]
               #navigationTime['dnsLookupTime'] = x.split("dnsLookupTime\":")[1].split("},\"eventProperties",1)[0]
            
            #if 'networkInformation' in x:
               #networkInf['downlink'] = x.split("downlink\":")[1].split(",\"effectiveType")[0]
               #networkInf['effectiveType'] = x.split("effectiveType\":\"")[1].split("\",\"rtt")[0]
               #networkInf['rtt'] = x.split("rtt\":")[1].split(",\"saveData")[0]
               #networkInf['saveData'] = x.split("saveData\":")[1].split("},\"eventProperties",1)[0]

            #if 'storageEstimate' in x:
               #storageEstimate['quota'] = x.split("quota\":")[1].split(",\"usage")[0]
               #storageEstimate['usage'] = x.split("usage\":")[1].split(",\"caches")[0]
               #storageEstimate['caches'] = x.split("caches\":")[1].split(",\"indexedDB")[0]
               #storageEstimate['indexedDB'] = x.split("indexedDB\":")[1].split(",\"serviceWorker")[0]
               #storageEstimate['serviceWorker'] = x.split("serviceWorker\":")[1].split("},\"eventProperties",1)[0]
            #break
    #print(storageEstimate)
    #print(networkInf)
    #print(navigationTime)
    #print(results)
    #with open(kwargs['output_dir'] + '/batterystats/' + 'load_' + 'results_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S')), 'w') as f:  # Just use 'w' mode in 3.x 'w' mode in 3.x
        #w = csv.DictWriter(f, results.keys())
        #w.writeheader()
        #w.writerow(results)

    #with open(kwargs['output_dir'] + '/batterystats/' + 'navigationTiming_' + 'results_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S')), 'w') as f:  # Just use 'w' mode in 3.x 'w' mode in 3.x
        #w = csv.DictWriter(f, navigationTime.keys())
        #w.writeheader()
        #w.writerow(navigationTime)

    #with open(kwargs['output_dir'] + '/batterystats/' + 'networkInfo_' + 'results_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S')), 'w') as f:  # Just use 'w' mode in 3.x 'w' mode in 3.x
        #w = csv.DictWriter(f, networkInf.keys())
        #w.writeheader()
        #w.writerow(networkInf)

    #with open(kwargs['output_dir'] + '/batterystats/' + 'storageEstimate_' + 'results_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S')), 'w') as f:  # Just use 'w' mode in 3.x 'w' mode in 3.x
        #w = csv.DictWriter(f, storageEstimate.keys())
        #w.writeheader()
        #w.writerow(storageEstimate)
