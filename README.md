# super-convergence

Here are the Caffe files of our recent work: 
Smith, Leslie N. and Nicholay Topin "Super-Convergence: Very Fast Training of Residual Networks Using Large Learning Rates"  arXiv preprint arXiv:1708.07120 (2017).  Please read the paper for details. In addition, see the paper "Cyclical Learning Rates for Training Neural Networks" at https://arxiv.org/pdf/1506.01186.pdf for instructions on implementing cyclical learning rates in Caffe.

Note: I just uploaded the outputs from my own replication to the new results folder.  These outputs should be helpful references for replicating the figures in the paper.


Instructions:

To simplify the replication of the figures in the paper, a shell script x.sh is included, which we used to replicate our experiments and create the figures in the paper.  This execution script shows the changes to each file needed for each run.  Below we spell out these changes.

From caffe home directory:
./build/tools/caffe train --solver=$SOLVER -gpu=all


As provided, this solver file trains the CLR network from Figure 1a. Changes must be made to reproduce other experiments, as listed below. 

	Fig. 1a:
		LR=0.35:
		$SOLVER should be the provided "solver.prototxt". 	
			net: ".../Resnet56Cifar.prototxt"
			test_iter: 200
			test_interval: 100
			display: 100
			lr_policy: "multistep"
			stepvalue: 50000
			stepvalue: 70000
			base_lr: 0.35
			gamma: 0.1
			max_iter: 80000
			weight_decay: 1e-4
			momentum: 0.9

		CLR=0.1-3.0:
		$SOLVER should be the provided "clrsolver.prototxt". 
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3.0
			stepsize: 5000
			max_iter: 10000
			weight_decay: 1e-4
			momentum: 0.9

	Fig. 1b:
	$SOLVER should be the provided "clrsolver.prototxt". 
		Stepsize=10k:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3.0
			stepsize: 10000
			max_iter: 20000
		Stepsize=5k:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3.0
			stepsize: 5000
			max_iter: 10000
		Stepsize=3k:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3.0
			stepsize: 3000
			max_iter: 6000
		Stepsize=1k:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3.0
			stepsize: 1000
			max_iter: 2000
			
	Fig. 2a:
		Figured reproduced from Smith [2017] with permission.

	Fig. 2b:
	$SOLVER should be the provided "lrRangeSolver.prototxt". 
		Max Iter=5k:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 3.0
			stepsize: 5000
			max_iter: 5000
		Max Iter=20k:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 3.0
			stepsize: 20000
			max_iter: 20000
		Max Iter=100k:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 3.0
			stepsize: 100000
			max_iter: 100000

	Fig. 3a:
		Figure reproduced from Goodfellow et al. [2014] with permission.
		
	Fig. 3b:
		Figure reproduced from Goodfellow et al. [2014] with permission.

	Fig. 4a:
	$SOLVER should be the provided "lrRangeSolver.prototxt". 
		Single network:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 1.5
			stepsize: 20000
			max_iter: 20000

	Fig. 4b:
		Resnet-20:
			net: ".../Resnet20Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 1.5
			stepsize: 20000
			max_iter: 20000
		Resnet-110:
			net: ".../Resnet110Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 1.5
			stepsize: 20000
			max_iter: 20000

	Fig. 5a:
		Need to write out snapshots every iteration for 300 iterations
		Modify L2TermComputation3.py:
			netProto = 
			presnapshot = 
			postsnapshot = 


	Fig. 5b:
		Need to write out snapshots every 10th iteration for 10000 iterations
		Modify L2TermComputation4.py:
			netProto = 
			presnapshot = 
			postsnapshot = 

	Fig. 6a:
		Same solver settings as Fig. 1a. 
		Training LMDB (or other source) listed within architecture must be re-made with fewer samples.

	Fig. 6b:
		$SOLVER should be the provided "solver.prototxt". 	
		Resnet-110 LR=0.35:
			net: ".../Resnet110Cifar.prototxt"
			lr_policy: "multistep"
			stepvalue: 50000
			stepvalue: 70000
			base_lr: 0.35
			gamma: 0.1
			max_iter: 80000
		$SOLVER should be the provided "clrsolver.prototxt". 
		Resnet-110 CLR=0.1-3 SS=10k:
			net: ".../Resnet110Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3
			stepsize: 10000
			max_iter: 20000
		$SOLVER should be the provided "solver.prototxt". 	
		Resnet-20 LR=0.35:
			net: ".../Resnet20Cifar.prototxt"
			lr_policy: "multistep"
			stepvalue: 50000
			stepvalue: 70000
			base_lr: 0.35
			gamma: 0.1
			max_iter: 80000
		$SOLVER should be the provided "clrsolver.prototxt". 
		Resnet-20 CLR=0.1-3 SS=10k:
			net: ".../Resnet20Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3
			stepsize: 10000
			max_iter: 20000

	Fig. 7a:
	dataset used by network must be changed to CIFAR-100
	$SOLVER should be the provided "lrRangeSolver.prototxt". 
		Single network:
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 3.0
			stepsize: 20000
			max_iter: 20000

	Fig. 7b:
	dataset used by network must be changed to CIFAR-100
		LR=0.35:
		$SOLVER should be the provided "solver.prototxt". 
			net: ".../Resnet56Cifar.prototxt" 
			lr_policy: "multistep"
			stepvalue: 50000
			stepvalue: 70000
			base_lr: 0.35
			gamma: 0.1
			max_iter: 80000
		CLR=0.1-3 SS=5k:
		$SOLVER should be the provided "clrsolver.prototxt". 
			net: ".../Resnet56Cifar.prototxt"
			lr_policy: "triangular"
			base_lr: 0.1
			max_lr: 3.0
			stepsize: 5000
			max_iter: 10000
		
	Fig. 8a:
	$SOLVER should be the provided "solver.prototxt". 
		LR=0.35:
		All use solver settings from LR=0.35 in Fig. 1a, but with solver type changed.
			type: "Nesterov"
			type: "AdaDelta"
			type: "AdaGrad"  and remove momentum
			type: "Adam"     and base_lr:  0.0035

	Fig. 8b:
		LR=0.35:
		$SOLVER should be the provided "solver.prototxt". 
		Same solver settings as Fig. 9a, but with:
			type: "Nesterov"
		CLR=0.1-3 SS=5k:
		$SOLVER should be the provided "clrsolver.prototxt". 
		Same solver settings as Fig. 1a, but with:
			type: "Nesterov"

	Fig. 9a:
		Same solver settings as CLR=0.1-3.0 in Fig. 1a, but with batchSize changed within architecture.
		
	Fig. 9b:
		Same solver settings as CLR=0.1-3.0 in Fig. 1a, but with dropout ratio changed within architecture.

	Fig. 10a:
		Same solver settings as CLR=0.1-3.0 in Fig. 1a, but with momentum changed.
		
	Fig. 10b:
		Same solver settings as CLR=0.1-3.0 in Fig. 1a, but with weight_decay changed.
		
	Fig. 11a:
	$SOLVER should be the provided "clrsolver.prototxt". 
		Single network:
			net: ".../bottleneckResnet56.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 0.61
			stepsize: 50000
			max_iter: 50000

	Fig. 11b:
	$SOLVER should be the provided "clrsolver.prototxt". 
		Single network:
			net: ".../ResNeXt56.prototxt"
			lr_policy: "triangular"
			base_lr: 0
			max_lr: 0.7
			stepsize: 50000
			max_iter: 50000
		
