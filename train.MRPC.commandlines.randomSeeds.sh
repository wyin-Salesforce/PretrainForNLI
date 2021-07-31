export BATCHSIZE=5 #2, 3, 5, 2, 5
export PRETRAINBATCHSIZE=32
export EPOCHSIZE=20
export PRETRAINSAMPLESIZE=50
export LEARNINGRATE=1e-6
export PRETRAINEPOCHS=5


CUDA_VISIBLE_DEVICES=4 python -u train.MRPC.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs $PRETRAINEPOCHS \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 42 > log.MRPC.PretrainEpochs.$PRETRAINEPOCHS.seed.42.txt 2>&1 &


CUDA_VISIBLE_DEVICES=5 python -u train.MRPC.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs $PRETRAINEPOCHS \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 16 > log.MRPC.PretrainEpochs.$PRETRAINEPOCHS.seed.16.txt 2>&1 &

CUDA_VISIBLE_DEVICES=6 python -u train.MRPC.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs $PRETRAINEPOCHS \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 32 > log.MRPC.PretrainEpochs.$PRETRAINEPOCHS.seed.32.txt 2>&1 &

CUDA_VISIBLE_DEVICES=7 python -u train.MRPC.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs $PRETRAINEPOCHS \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 64 > log.MRPC.PretrainEpochs.$PRETRAINEPOCHS.seed.64.txt 2>&1 &
