#########################################################################
# File Name: format_file_form_from_git_st.sh
# Author: zml
# mail: zhangmaolin@le.com
# Created Time: Mon 26 Sep 2016 07:08:05 PM CST
#########################################################################
#!/bin/bash
#get filename from git
aa=`git st`
#echo aa = $aa
flag_record=false
for a in $aa;do
    if [ "$flag_record"x = "true"x ];then
        filenames="$filenames $a"
    fi
    flag_record=false
    if [ "$a"x = "modified:"x -o "$a"x = "file:"x ];then
        #echo "haha,get a = $a"
        flag_record=true
    fi
    #echo "a=$a"
done
#echo "filenames=$filenames"

#format the file
for filename in $filenames; do
    format_file_form.sh $filename
done
