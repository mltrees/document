#########################################################################
# File Name: format_file_form_from_git_st.sh
# Author: zml
# mail: zhangmaolin@le.com
# Created Time: Mon 26 Sep 2016 07:08:05 PM CST
#########################################################################
#!/bin/bash
#get filename from git
if [ $# != 1 ];then
    echo "please input the change file path"
    exit 1;
fi
SRC_DIR=/f/src/prediction_services
DES_DIR=/home/admin/zhangmaolin/prediction_services
filenames=$1
flag_record=false
PORT=2222


for f in $(cat $filenames);do
    echo "f=$f"
    if [ "$f"x = ""x ]; then
        echo "empty line, not used"
    else
    cmd="scp -P $PORT $SRC_DIR/$f $DES_DIR/$f"
    echo "cmd=$cmd"
    #`$cmd`
    fi
done

