import codecs

def check_MRPC():
    read_gold_test = codecs.open('/export/share/wenpeng/glue_data/MRPC/msr_paraphrase_test.txt', 'r', 'utf-8')
    gold_list = []
    line_co=0
    for line in read_gold_test:
        if line_co>0:
            parts = line.strip().split('\t')
            sent1 = parts[1]
            sent2 = parts[2]
            gold_list.append((sent1, sent2))
        line_co+=1
    read_gold_test.close()
    read_new_test = codecs.open('/export/share/wenpeng/glue_data/MRPC/test.tsv', 'r', 'utf-8')
    line_co=0
    for line in read_new_test:
        if line_co>0:
            parts = line.strip().split('\t')
            sent1 = parts[1]
            sent2 = parts[2]
            if (sent1, sent2) not in gold_list:
                print('not there')
        line_co+=1
    read_new_test.close()

if __name__ == "__main__":
    check_MRPC()
