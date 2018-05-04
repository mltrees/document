#########################################################################
# File Name: ln_release_debug_folder.sh
# Author: zml
# mail: zhangmaolin@le.com
# Created Time: Fri 18 Nov 2016 02:30:35 PM CST
#########################################################################
#!/bin/bash
#root_dir=`pwd`
root_dir=/data/zhangmaolin/search_and_rec
echo "root_dir=$root_dir"
release_folders=`find $root_dir -name lib64_release`
echo "release_folders=$release_folders"
for release_folder in $release_folders; do
#    echo "release_folder=$release_folder"
    debug_folder=${release_folder/release/debug};
#    echo "debug_folder=$debug_folder"
    ln -s $release_folder $debug_folder
done
