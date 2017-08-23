#!/usr/bin/env sh

# shorter jobs: FIG1b,  TAB1a, TAB1b, FIG10a, FIG10b, FIG11a, FIG11b
# long jobs: FIG1a, FIG2b, FIG4a, FIG4b,TAB1c, FIG6b, FIG8, FIG9
FIG=FIG8

if [ $FIG == FIG1a ]; then

   cp qsub.pbs xqsub.pbs
#   sed s/train.sh/xtrain.sh/g  qsub.pbs > xqsub.pbs
#   sed s/solver.prototxt/xsolver.prototxt/g train.sh > xtrain.sh
#   sed s/Resnet56Cifar.prototxt/arch.prototxt/g solver.prototxt > xsolver.prototxt
   cp train.sh  xtrain.sh
   cp solver.prototxt xsolver.prototxt
   cp architectures/Resnet56Cifar.prototxt architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kFig1a/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kFig1a/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == FIG1b ]; then
#  Different step sizes

   sed s/Fig1a/Fig1b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS10kFig1b/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS10kFig1b/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/20000/g xsolver.prototxt > tmp
   sed s/5000/10000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS3kFig1b/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS3kFig1b/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/6000/g xsolver.prototxt > tmp
   sed s/5000/3000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS1kFig1b/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS1kFig1b/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/2000/g xsolver.prototxt > tmp
   sed s/5000/1000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == FIG2b ]; then

   sed s/Fig1a/Fig2b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/range3Iter100kFig2b/g train.sh > xtrain.sh
   sed s/Fig2b/range3Iter100kFig2b/g lrRangeSolver.prototxt > tmp
   sed s/20000/100000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/range3Iter20kFig2b/g train.sh > xtrain.sh
   sed s/Fig2b/range3Iter20kFig2b/g lrRangeSolver.prototxt > tmp
   sed s/20000/20000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/range3Iter5kFig2b/g train.sh > xtrain.sh
   sed s/Fig2b/range3Iter5kFig2b/g lrRangeSolver.prototxt > tmp
   sed s/20000/5000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == FIG4a ]; then
#  Show regularization

   sed s/Fig1a/Fig4a/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/range2SS80kRes56wd0/g train.sh > xtrain.sh
   sed s/Fig2b/range2SS80kRes56wd0/g lrRangeSolver.prototxt > xsolver.prototxt
   sed s/'max_lr: 3'/'max_lr: 2'/g xsolver.prototxt > tmp
   sed s/20000/80000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/'use_global_stats: true'/'use_global_stats: false'/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/range2SS80kRes56LR/g train.sh > xtrain.sh
   sed s/Fig2b/range2SS80kRes56LR/g lrRangeSolver.prototxt > xsolver.prototxt
   sed s/'max_lr: 3'/'max_lr: 2'/g xsolver.prototxt > tmp
   sed s/20000/80000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  ../largeLR/architectures/Resnet56Cifar.prototxt > tmp
   sed s/'use_global_stats: true'/'use_global_stats: false'/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs


elif [ $FIG == FIG4b ]; then
#  Show regularization for Res110 and Res20

   sed s/Fig1a/Fig4a/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/range2SS80kRes56/g train.sh > xtrain.sh
   sed s/Fig2b/range2SS80kRes56/g lrRangeSolver.prototxt > xsolver.prototxt
   sed s/'max_lr: 3'/'max_lr: 2'/g xsolver.prototxt > tmp
   sed s/20000/80000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56DM1.prototxt > tmp
   sed s/'use_global_stats: true'/'use_global_stats: false'/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/Fig1a/Fig4b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/range2Res110Fig4b/g train.sh > xtrain.sh
   sed s/Fig2b/range2Res110Fig4b/g lrRangeSolver.prototxt > xsolver.prototxt
   sed s/'max_lr: 3'/'max_lr: 2'/g  xsolver.prototxt > tmp
   sed s/20000/80000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet110Cifar.prototxt > tmp
   sed s/125/100/g  tmp  > architectures/arch.prototxt
   qsub xqsub.pbs

   sleep 30

   sed s/Fig1a/Fig4b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/range2Res20Fig4b/g train.sh > xtrain.sh
   sed s/Fig2b/range2Res20Fig4b/g lrRangeSolver.prototxt > xsolver.prototxt
   sed s/'max_lr: 3'/'max_lr: 2'/g xsolver.prototxt > tmp
   sed s/20000/80000/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet20Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == TAB1a ]; then
#  CLR with a range of max_lr

   sed s/Fig1a/Tab1a/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr35SS5kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr35SS5kTab1/g clrsolver.prototxt > tmp
   sed s/'max_lr:  3.0'/'max_lr:  3.5'/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr25SS5kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr25SS5kTab1/g clrsolver.prototxt > tmp
   sed s/'max_lr:  3.0'/'max_lr:  2.5'/g tmp > xsolver.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr2SS5kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr2SS5kTab1/g clrsolver.prototxt > tmp
   sed s/'max_lr:  3.0'/'max_lr:  2.'/g tmp > xsolver.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr15SS5kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr15SS5kTab1/g clrsolver.prototxt > tmp
   sed s/'max_lr:  3.0'/'max_lr:  1.5'/g tmp > xsolver.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/Fig1a/Tab1a/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr1SS5kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr1SS5kTab1/g clrsolver.prototxt > tmp
   sed s/'max_lr:  3.0'/'max_lr:  1.0'/g tmp > xsolver.prototxt
   qsub xqsub.pbs

elif [ $FIG == TAB1b ]; then
#  CLR with different step sizes

   sed s/Fig1a/Tab1b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS10kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS10kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/20000/g xsolver.prototxt > tmp
   sed s/5000/10000/g tmp > xsolver.prototxt
   sed s/0.999/0.97/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS75kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS75kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/15000/g xsolver.prototxt > tmp
   sed s/5000/7500/g tmp > xsolver.prototxt
   sed s/0.999/0.96/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS4kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS4kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/8000/g xsolver.prototxt > tmp
   sed s/5000/4000/g tmp > xsolver.prototxt
   sed s/0.999/0.93/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS3kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS3kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/6000/g xsolver.prototxt > tmp
   sed s/5000/3000/g tmp > xsolver.prototxt
   sed s/0.999/0.90/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS2kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS2kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/4000/g xsolver.prototxt > tmp
   sed s/5000/2000/g tmp > xsolver.prototxt
   sed s/0.999/0.85/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS1kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS1kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/10000/2000/g xsolver.prototxt > tmp
   sed s/5000/1000/g tmp > xsolver.prototxt
   sed s/0.999/0.80/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == TAB1c ]; then
#  Limited number of training data

   sed s/Fig1a/Tab1c/g  qsub.pbs > xqsub.pbs

   sed s/lr35Fig1a/lr35Tr40kTab1/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35Tr40kTab1/g solver.prototxt > xsolver.prototxt
   sed s/'train_lmdb'/'train40k_lmdb'/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/lr35Tr30kTab1/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35Tr30kTab1/g solver.prototxt > xsolver.prototxt
   sed s/'train_lmdb'/'train30k_lmdb'/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/lr35Tr20kTab1/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35Tr20kTab1/g solver.prototxt > xsolver.prototxt
   sed s/'train_lmdb'/'train20k_lmdb'/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/lr35Tr10kTab1/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35Tr10kTab1/g solver.prototxt > xsolver.prototxt
   sed s/'train_lmdb'/'train10k_lmdb'/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kTr40kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kTr40kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/'train_lmdb'/'train40k_lmdb'/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/Fig1a/Tab1c/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS5kTr30kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kTr30kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/'train_lmdb'/'train30k_lmdb'/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/Fig1a/Tab1c/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS5kTr20kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kTr20kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/'train_lmdb'/'train20k_lmdb'/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/Fig1a/Tab1c/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS5kTr10kTab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kTr10kTab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/'train_lmdb'/'train10k_lmdb'/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

elif [ $FIG == FIG6b ]; then
# LR vs CLR for Res110 and Res20
   sed s/Fig1a/Fig6b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/lr35Res110Fig6b/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35Res110Fig6b/g solver.prototxt > xsolver.prototxt
   sed s/125/100/g  architectures/Resnet110Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kRes110Tab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kRes110Tab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/125/100/g  architectures/Resnet110Cifar.prototxt > tmp
   sed s/0.999/0.95/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30
exit
   sed s/lr35Fig1a/lr35Res20Fig6b/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35Res20Fig6b/g solver.prototxt > xsolver.prototxt
   cp  architectures/Resnet20Cifar.prototxt architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kRes20Tab1/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kRes20Tab1/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet20Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == FIG8 ]; then
# Cifar 100

   sed s/Fig1a/Fig8/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/lr35Cifar100Fig8/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35Cifar100Fig8/g solver.prototxt > xsolver.prototxt
   sed s/10/100/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kCifar100Fig8/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kCifar100Fig8/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/10/100/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/range3Cifar100kFig8/g train.sh > xtrain.sh
   sed s/Fig2b/range3Cifar100kFig8/g lrRangeSolver.prototxt > xsolver.prototxt
   qsub xqsub.pbs

elif [ $FIG == FIG9 ]; then
# Adaptive LRs

   sed s/Fig1a/Fig9a/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/lr35AdaGradFig9/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35AdaGradFig9/g solver.prototxt > xsolver.prototxt
   sed s/'#type:'/'type: "AdaGrad"  #'/g  xsolver.prototxt > tmp
   sed s/momentum/'#momentum'/g  tmp > xsolver.prototxt 
   cp  architectures/Resnet56Cifar.prototxt architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/lr35NestFig9/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35NestFig9/g solver.prototxt > xsolver.prototxt
   sed s/'#type'/type/g  xsolver.prototxt > tmp
   sed s/Adam/Nesterov/g  tmp > xsolver.prototxt 
   cp  architectures/Resnet56Cifar.prototxt architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/lr35AdamFig9/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35AdamFig9/g solver.prototxt > xsolver.prototxt
   sed s/'#type'/type/g  xsolver.prototxt > tmp
   sed s/'base_lr: 0.35'/'base_lr: 0.0035'/g  tmp > xsolver.prototxt 
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/lr35AdaDeltaFig9/g train.sh > xtrain.sh
   sed s/lr35Fig1a/lr35AdaDeltaFig9/g solver.prototxt > tmp
   sed s/'#type'/type/g  tmp > xsolver.prototxt
   sed s/Adam/AdaDelta/g  xsolver.prototxt > tmp
   sed s/'momentum'/'#momentum'/g  tmp > xsolver.prototxt 
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kNestFig9/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kNestFig9/g clrsolver.prototxt > xsolver.prototxt
   sed s/'#type'/type/g  xsolver.prototxt > tmp
   sed s/Adam/Nesterov/g  tmp > xsolver.prototxt 
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   
elif [ $FIG == FIG10a ]; then
# Batch sizes

   sed s/Fig1a/Fig10a/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS5kBS1536Fig10/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kBS1536Fig10/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/125/192/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kBS512Fig10/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kBS512Fig10/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/125/64/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kBS256Fig10/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kBS256Fig10/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > tmp
   sed s/125/32/g  tmp > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == FIG10b ]; then
# Dropout

   sed s/Fig1a/Fig10b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS5kDropoutFig10/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kDropoutFig10/g clrsolver.prototxt > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Dropout.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

elif [ $FIG == FIG11a ]; then
# Momentum

   sed s/Fig1a/Fig11a/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS5kMom95Fig11/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kMom95Fig11/g clrsolver.prototxt > tmp
   sed s/'momentum: 0.9'/'momentum: 0.95'/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kMom85Fig11/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kMom85Fig11/g clrsolver.prototxt > tmp
   sed s/'momentum: 0.9'/'momentum: 0.85'/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kMom8Fig11/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kMom8Fig11/g clrsolver.prototxt > tmp
   sed s/'momentum: 0.9'/'momentum: 0.8'/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs

elif [ $FIG == FIG11b ]; then
# Weight Decay

   sed s/Fig1a/Fig11b/g  qsub.pbs > xqsub.pbs
   sed s/lr35Fig1a/clr3SS5kWD-3Fig11/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kWD-3Fig11/g clrsolver.prototxt > tmp
   sed s/'1e-4'/'1e-3'/g tmp > xsolver.prototxt
   sed s/0.999/0.95/g  architectures/Resnet56Cifar.prototxt > architectures/arch.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kWD-5Fig11/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kWD-5Fig11/g clrsolver.prototxt > tmp
   sed s/'1e-4'/'1e-5'/g tmp > xsolver.prototxt
   qsub xqsub.pbs
   sleep 30

   sed s/lr35Fig1a/clr3SS5kWD-6Fig11/g train.sh > xtrain.sh
   sed s/fig1a/clr3SS5kWD-6Fig11/g clrsolver.prototxt > tmp
   sed s/'1e-4'/'1e-6'/g tmp > xsolver.prototxt
   qsub xqsub.pbs


   
fi

qstat

exit
