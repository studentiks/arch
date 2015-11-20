#!/usr/bin/python

import time, configparser, argparse, logging, sys, os.path

parser = argparse.ArgumentParser()
parser.add_argument('--config', help='configuration file', required=True)
args = parser.parse_args()

config = configparser.ConfigParser()
path = os.path.abspath(args.config)

config.read(path)
config = config['main']

logging_format = config.get('log format', fallback='%(asctime)s %(levelname)s(%(filename)s:%(lineno)d)\t%(message)s')
logging_levels = 'DEBUG INFO ERROR'.split()
logging_level = config.get('log level')
logging_level = getattr(logging, logging_level) if logging_level in logging_levels else logging.INFO

logging.basicConfig(format=logging_format, level=logging_level, stream=sys.stdout)

sleep = config.getint('sleep')
temp_ffn= open(config.get('temperature'))
speed_ffn = open(config.get('fan control'), 'r+')

def fan_speed(temp, speed):
 temp_low = config.getint('temperature low')
 temp_high = config.getint('temperature high')
 temp_max = config.getint('temperature max')

 speed_min = config.getint('fan speed min')
 speed_low = config.getint('fan speed low')
 speed_max = config.getint('fan speed max')

 # hot
 if temp >= temp_max:
  logging.debug('hot')
  return speed_max

 # cold
 if temp < temp_low:
  logging.debug('cold')
  return speed_min

 if speed == speed_min and temp < temp_high:
  logging.debug('still cold')
  return speed_min

 # getting warm
 if speed == speed_min and temp >= temp_high:
  logging.debug('getting warm')
  return speed_low

 return min(speed_low + int((speed_max - speed_low) * (temp - temp_low) / (temp_max - temp_low)), speed_max)

while True:
 temp_ffn.seek(0)
 speed_ffn.seek(0)
 ct = int(temp_ffn.read())
 cs = int(speed_ffn.read())
 new_speed = fan_speed(ct, cs)
 logging.debug('current temperature: %s, fan speed %s', ct, cs)

 # if new_speed != cs
 new_speed = str(new_speed)
 logging.debug('setting fan speed to %s', new_speed)
 speed_ffn.seek(0)
 speed_ffn.write(new_speed)

 time.sleep(sleep)

