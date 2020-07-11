import logging
from ExperimentRunner.Plugins.Profiler import Profiler

class ProfilerTest(Profiler):

    # noinspection PyUnusedLocal
    def __init__(self, config, paths):
        super(ProfilerTest, self).__init__(config, paths)
        self.output_dir = ''
        self.logcat_output = ''
        self.profile = False

    def dependencies(self):
        return[]

    def load(self, device):
        return

    def start_profiling(self, device, **kwargs):
        self.profile = True
        self.logcat_output = '{}logcat_{}_{}.txt'.format(self.output_dir, device.id, time.strftime('%Y.%m.%d_%H%M%S'))

    def stop_profiling(self, device, **kwargs):
        self.profile = False

    def collect_results(self, device):
        print("Hello")
        device.shell('logcat -f /mnt/sdcard/logcat.txt -d')

        if 'error' in device.pull('/mnt/sdcard/logcat.txt', self.logcat_output).decode():
            self.logger.critical('Failed to pull logcat log file from the device which makes it impossible to gather GC calls.')
            return

        device.shell('rm -f /mnt/sdcard/logcat.txt')

        #collections_filename = 'collections_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S'))
        #total_filename = 'total_{}_{}.csv'.format(device.id, time.strftime('%Y.%m.%d_%H%M%S'))
        #collections_count = 0

        with open(self.logcat_output) as logcat:
            lines = logcat.readlines()
            for i, line in enumerate(lines):
                if 'Lacuna' in line or 'Lacuna' in line:
                   print(lines)

    def unload(self, device):
        return

    def set_output(self, output_dir):
        self.output_dir = output_dir

    def aggregate_subject(self):
        return

    def aggregate_end(self, data_dir, output_file):
        return
