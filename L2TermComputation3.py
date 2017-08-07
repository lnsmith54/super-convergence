#make sure to set env vars first: 
#export PYTHONPATH=/home/lsmith/software/caffe-5-1-17/python/:$PYTHONPATH

import sys
import subprocess
import os
import math
import numpy as np

os.environ['GLOG_minloglevel'] = '2' 
#must be done before importing caffe; prevents tons of screen output during net load

import caffe
caffe.set_mode_gpu()
caffe.set_device(0)

netProto = '/home/lsmith/software/caffe-5-1-17/examples/largeLR/architectures/Resnet56Cifar.prototxt'
presnapshot = 'examples/largeLR/snapshots/cifar20kResnet56CLR3SS5k_iter_'
postsnapshot = '.caffemodel'

movingAvg = 0.1
alpha = 0.1
inc = 1
#for i in range(10, 9990, 10):
for i in range(inc, 298, inc):

  net1Snapshot = presnapshot + `i` + postsnapshot
  net2Snapshot = presnapshot + `i+inc` + postsnapshot
  net3Snapshot = presnapshot + `i+2*inc` + postsnapshot

  if i < 5000:
    LR = 0.1 + 2.9*i/5000
  else:
    LR = 3.0 - 2.9*(i-5000)/5000   


  #print('Loading net 1.')
  sys.stdout.flush()
  net1 = caffe.Net(netProto, net1Snapshot, caffe.TEST)
  #print('Loading net 2.')
  sys.stdout.flush()
  net2 = caffe.Net(netProto, net2Snapshot, caffe.TEST)
  #print('Loading net 3.')
  sys.stdout.flush()
  net3 = caffe.Net(netProto, net3Snapshot, caffe.TEST)

  topTerm = 0
  for param in net2.params: #over each layer
	for paramLayer in range(0, len(net2.params[param])): #over each parameter in layer (weight, bias, etc)
  		topTerm += np.sum(map(lambda x: abs(x), net2.params[param][paramLayer].data - net1.params[param][paramLayer].data))

  botTerm = 0
  for param in net1.params: #over each layer
	for paramLayer in range(0, len(net1.params[param])): #over each parameter in layer (weight, bias, etc)
		botTerm += np.sum(map(lambda x: abs(x), 2*net2.params[param][paramLayer].data - net1.params[param][paramLayer].data - net3.params[param][paramLayer].data))

  movingAvg = (1-alpha)*movingAvg + LR*alpha*topTerm/botTerm
#  print(math.sqrt(topTerm/botTerm)/10 )
  print(movingAvg, LR, topTerm, botTerm)


