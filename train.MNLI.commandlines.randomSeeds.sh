export BATCHSIZE=32 #2, 3, 5, 2, 5
export PRETRAINBATCHSIZE=32
export EPOCHSIZE=10
export PRETRAINSAMPLESIZE=50
export LEARNINGRATE=1e-6
export PRETRAINEPOCHS=1


CUDA_VISIBLE_DEVICES=0 python -u train.MNLI.py \
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
    --seed 42 > log.MNLI.PretrainEpochs.$PRETRAINEPOCHS.seed.42.txt 2>&1 &


CUDA_VISIBLE_DEVICES=1 python -u train.MNLI.py \
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
    --seed 16 > log.MNLI.PretrainEpochs.$PRETRAINEPOCHS.seed.16.txt 2>&1 &

CUDA_VISIBLE_DEVICES=2 python -u train.MNLI.py \
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
    --seed 32 > log.MNLI.PretrainEpochs.$PRETRAINEPOCHS.seed.32.txt 2>&1 &

CUDA_VISIBLE_DEVICES=3 python -u train.MNLI.py \
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
    --seed 64 > log.MNLI.PretrainEpochs.$PRETRAINEPOCHS.seed.64.txt 2>&1 &
