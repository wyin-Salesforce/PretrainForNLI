export BATCHSIZE=5 #2, 3, 5, 2, 5
export PRETRAINBATCHSIZE=64
export EPOCHSIZE=20
export PRETRAINSAMPLESIZE=50
export LEARNINGRATE=1e-6

CUDA_VISIBLE_DEVICES=0 python -u train.RTE.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs 10 \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 42 > log.RTE.PretrainEpochs.10.txt 2>&1 &

CUDA_VISIBLE_DEVICES=1 python -u train.RTE.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs 20 \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 42 > log.RTE.PretrainEpochs.20.txt 2>&1 &

CUDA_VISIBLE_DEVICES=2 python -u train.RTE.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs 30 \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 42 > log.RTE.PretrainEpochs.30.txt 2>&1 &

CUDA_VISIBLE_DEVICES=3 python -u train.RTE.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs 40 \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 42 > log.RTE.PretrainEpochs.40.txt 2>&1 &


CUDA_VISIBLE_DEVICES=4 python -u train.RTE.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs 50 \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 42 > log.RTE.PretrainEpochs.50.txt 2>&1 &

CUDA_VISIBLE_DEVICES=5 python -u train.RTE.py \
    --task_name rte \
    --do_train \
    --do_lower_case \
    --num_train_epochs $EPOCHSIZE \
    --pretrain_epochs 60 \
    --pretrain_sample_size $PRETRAINSAMPLESIZE \
    --train_batch_size $BATCHSIZE \
    --pretrain_batch_size $PRETRAINBATCHSIZE \
    --eval_batch_size 32 \
    --learning_rate $LEARNINGRATE \
    --max_seq_length 128 \
    --seed 42 > log.RTE.PretrainEpochs.60.txt 2>&1 &
