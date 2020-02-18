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
    for x in logcat_output:
        if 'Load' in x:
            results = eval("{" + x.split("{")[1].split("}")[0] + "}")
            break
    print(logcat_output)
    print(results)
    with open(kwargs['output_dir'] + '/batterystats/' + 'load_' + 'results_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S')), 'wb') as f:  # Just use 'w' mode in 3.x 'w' mode in 3.x
        w = csv.DictWriter(f, results.keys())
        w.writeheader()
        w.writerow(results)
