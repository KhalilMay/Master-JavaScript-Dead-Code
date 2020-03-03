import sys
import ast
from datetime import datetime
import csv
import paths
import time

def main(device, *args, **kwargs):
    print('=INTERACTION=')
    print("Waiting for log...")
    results = {}
    logcat_output = device.logcat_regex("Master-Thesis:").splitlines()
    print(logcat_output)
    for x in logcat_output:
        if 'Load' in str(x,'utf-8'):
            x= str(x,'utf-8')
            results = eval("{" + x.split("{")[1].split("}")[0] + "}")
            break
    print(logcat_output)
    print(results)
    with open(kwargs['output_dir'] + '/batterystats/' + 'load_' + 'results_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S')), 'w') as f:  # Just use 'w' mode in 3.x 'w' mode in 3.x
        w = csv.DictWriter(f, results.keys())
        w.writeheader()
        w.writerow(results)
