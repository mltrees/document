#########################################################################
# File Name: format_file_form.sh
# Author: zml
# mail: zhangmaolin1@jd.com
# Created Time: Mon 26 Sep 2016 07:09:03 PM CST
#########################################################################
#!/bin/bash
#filenames=$1
filenames=$*
echo "total input = $#"
#CURRENT_DIR=`pwd`
CURRENT_DIR=`dirname $0`
ROOT_DIR=$CURRENT_DIR/..
#ASTYLE=$ROOT_DIR/astyle/build/gcc/bin/astyle
ASTYLE=/home/zhangmaolin/bin/astyle
for filename in $filenames; do
    # astyle the file
    filename_suffix=${filename##*.}
    if [ "$filename_suffix"x = "h"x ];then
       # $ASTYLE --style=google -s4 --indent=spaces=2 $filename
       # $ASTYLE --style=google $filename --suffix=none
        $ASTYLE --style=google --indent=tab --max-code-length=80 --break-after-logical $filename --suffix=none
    elif [ "$filename_suffix"x = "c"x -o "$filename_suffix"x = "cc"x -o "$filename_suffix"x = "cpp"x ]; then
        $ASTYLE --style=google --indent=tab $filename --max-code-length=80 --break-after-logical --suffix=none
    else
        echo "$filename is not a c++ file"
    fi
    dos2unix $filename
    sed -i 's/ *$//g' $filename        
    #sed -i 's/\t/    /g' $filename
    sed -i 's/    /\t/g' $filename
done
