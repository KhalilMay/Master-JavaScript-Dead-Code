import os
import re
import random
from datetime import datetime

import numpy as np
import pandas as pd

def init_category(dictionary, category):
    dictionary[category] = {}
    return dictionary


def explore_subjects(path):
    level0_Sites = {}
    level1_Sites = {}
    level2_Sites = {}
    level3_Sites = {}
    
    # Explore the used subjects and save the path to their results
    for item  in os.listdir(path):
        if item == '.DS_Store':
            continue
        category = ''
        site_version = ''
        item1 = item.split("2020")[1]
        # Determine category
        if '0' in item1:
            category = '0'
        elif '1' in item1:
            category = '1'
        elif '2' in item1:
            category = '2'
        elif '3' in item1:
            category = '3'

        if category not in level0_Sites:
            level0_Sites = init_category(level0_Sites, category)
        
        if category not in level1_Sites:
            level1_Sites = init_category(level1_Sites, category)

        if category not in level2_Sites:
            level2_Sites = init_category(level2_Sites, category)

        if category not in level3_Sites:
            level3_Sites = init_category(level3_Sites, category)

        # Determine Site origin
        #if 'critical' in item:
            #site_version = 'critical'
        #elif 'original' in item:
            #site_version = 'original'

        # Determine site name 
        dir_ending = item.split("2020")[1][:-1]
        site_name = dir_ending[int(len(dir_ending)/2):]


        if category == '0':
            level0_Sites[category][site_name] = path + '/' + item + '/chrome/batterystats/'
        elif category == '1':
            level1_Sites[category][site_name] = path + '/' + item + '/chrome/batterystats/'
        elif category == '2':
            level2_Sites[category][site_name] = path + '/' + item + '/chrome/batterystats/'
        elif category == '3':
            level3_Sites[category][site_name] = path + '/' + item + '/chrome/batterystats/'
    
    return level0_Sites, level1_Sites, level2_Sites, level3_Sites


def aggregate_subject(subject, n_runs):
    
    joule_values = {}
    memory_values = {}
    cpu_values = {}

    for item in os.listdir(subject):
        if item == '.DS_Store':
            continue
        date = item.split('results')[1].split('_')[2:4]
        date = ".".join(" ".join(date).split('.')[:-1])
        date_time = datetime.strptime(date, "%Y.%m.%d %H%M%S")

       
        if 'Joule_results_' in item:
            df = pd.read_csv(subject + item)
            joule_values[date_time] = df['Joule_calculated'][0]
        elif 'CPU_results_' in item:
            try:
                df = pd.read_csv(subject + item)
                cpu_values[date_time] = (df['CPU_Percentage_Usage'][0])
            except:
                cpu_values[date_time] = (0)
        elif 'Memory_results_' in item:
            df = pd.read_csv(subject + item)
            memory_values[date_time] = df['Memory_KByte_calculated'][0]
    
    print(subject)

    ordered_joule_values = [joule_values[key] for key in sorted(joule_values.keys())]
    joule_serie = pd.Series([subject.split('/')[-4]] + ordered_joule_values + [np.mean(ordered_joule_values)])

    ordered_cpu_values = [cpu_values[key] for key in sorted(cpu_values.keys())][:n_runs + 1]
    cpu_serie = pd.Series([subject.split('/')[-4]] + ordered_cpu_values + [np.mean(ordered_cpu_values)])

    ordered_memory_values = [memory_values[key] for key in sorted(memory_values.keys())]
    memory_serie = pd.Series([subject.split('/')[-4]] + ordered_memory_values + [np.mean(ordered_memory_values)])
    return joule_serie, cpu_serie, memory_serie


if __name__ == '__main__':
    path = "examples/batterystats/output/2020.02.12_061226/data/j7duo/"
    level0_Sites, level1_Sites, level2_Sites, level3_Sites = explore_subjects(path)
    eng_headers = ['Optimization Levels', 'Website'] + ['Run {}'.format(x) for x in range(1, 11)] + ['Average']
    memory_headers =  ['Optimization Levels', 'Website'] + ['Run {}'.format(x) for x in range(1, 11)] + ['Average']
    cpu_headers = ['Optimization Levels', 'Website'] + ['Run {}'.format(x) for x in range(1, 11)] + ['Average']
    # Parse level0 results
    level0_eng = pd.DataFrame(columns=eng_headers)
    level0_memory = pd.DataFrame(columns=memory_headers)
    level0_cpu = pd.DataFrame(columns=cpu_headers)
    for CSS_Size, contents in level0_Sites.items():
        for _, path in contents.items():
            res1, res2, res3 = aggregate_subject(path, 9)
            level0_eng = level0_eng.append(pd.Series([CSS_Size] + list(res1), index=level0_eng.columns), ignore_index=True)
            level0_cpu = level0_cpu.append(pd.Series([CSS_Size] + list(res2), index=level0_cpu.columns), ignore_index=True)
            level0_memory = level0_memory.append(pd.Series([CSS_Size] + list(res3), index=level0_memory.columns), ignore_index=True)
    
    level0_eng.to_csv('Aggregate_Metrics/level0_Results_Energy.csv', header=True, index=None)
    level0_cpu.to_csv('Aggregate_Metrics/level0_Results_CPU.csv', header=True, index=None)
    level0_memory.to_csv('Aggregate_Metrics/level0_Results_Memory.csv', header=True, index=None)
    
    # Parse level1
    level1_eng = pd.DataFrame(columns=eng_headers)
    level1_memory = pd.DataFrame(columns=memory_headers)
    level1_cpu = pd.DataFrame(columns=cpu_headers)
    for CSS_Size, contents in level1_Sites.items():
        for _, path in contents.items():
            res1, res2, res3 = aggregate_subject(path, 9)
            level1_eng = level1_eng.append(pd.Series([CSS_Size] + list(res1), index=level1_eng.columns), ignore_index=True)
            level1_cpu = level1_cpu.append(pd.Series([CSS_Size] + list(res2), index=level1_cpu.columns), ignore_index=True)
            level1_memory = level1_memory.append(pd.Series([CSS_Size] + list(res3), index=level1_memory.columns), ignore_index=True)
    
    
    level1_eng.to_csv('Aggregate_Metrics/level1_Results_Energy.csv', header=True, index=None)
    level1_cpu.to_csv('Aggregate_Metrics/level1_Results_CPU.csv', header=True, index=None)
    level1_memory.to_csv('Aggregate_Metrics/level1_Results_Memory.csv', header=True, index=None)

    # Parse level2
    level2_eng = pd.DataFrame(columns=eng_headers)
    level2_memory = pd.DataFrame(columns=memory_headers)
    level2_cpu = pd.DataFrame(columns=cpu_headers)
    for CSS_Size, contents in level2_Sites.items():
        for _, path in contents.items():
            res1, res2, res3 = aggregate_subject(path, 9)
            level2_eng = level2_eng.append(pd.Series([CSS_Size] + list(res1), index=level2_eng.columns), ignore_index=True)
            level2_cpu = level2_cpu.append(pd.Series([CSS_Size] + list(res2), index=level2_cpu.columns), ignore_index=True)
            level2_memory = level2_memory.append(pd.Series([CSS_Size] + list(res3), index=level2_memory.columns), ignore_index=True)
    
    level2_eng.to_csv('Aggregate_Metrics/level2_Results_Energy.csv', header=True, index=None)
    level2_cpu.to_csv('Aggregate_Metrics/level2_Results_CPU.csv', header=True, index=None)
    level2_memory.to_csv('Aggregate_Metrics/level2_Results_Memory.csv', header=True, index=None)

    # Parse level3
    level3_eng = pd.DataFrame(columns=eng_headers)
    level3_memory = pd.DataFrame(columns=memory_headers)
    level3_cpu = pd.DataFrame(columns=cpu_headers)
    for CSS_Size, contents in level3_Sites.items():
        for _, path in contents.items():
            res1, res2, res3 = aggregate_subject(path, 9)
            level3_eng = level3_eng.append(pd.Series([CSS_Size] + list(res1), index=level3_eng.columns), ignore_index=True)
            level3_cpu = level3_cpu.append(pd.Series([CSS_Size] + list(res2), index=level3_cpu.columns), ignore_index=True)
            level3_memory = level3_memory.append(pd.Series([CSS_Size] + list(res3), index=level3_memory.columns), ignore_index=True)
    
    level3_eng.to_csv('Aggregate_Metrics/level3_Results_Energy.csv', header=True, index=None)
    level3_cpu.to_csv('Aggregate_Metrics/level3_Results_CPU.csv', header=True, index=None)
    level3_memory.to_csv('Aggregate_Metrics/level3_Results_Memory.csv', header=True, index=None)
