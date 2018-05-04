#########################################################################
# File Name: async-to-test.sh
# Author: zml
# mail: zhangmaolin1@jd..com
# Created Time: Mon 31 Jul 2017 07:01:46 PM CST
#########################################################################
#!/bin/bash
# config
args=$1
if [ x"$args" = "x" ]; then
    echo "please input parameter \"conf/ps/bw/si/rec/soa/searcher/xapian\" "
elif [ x$args = x"conf" ]; then
    echo "update ps config"
    sh /d/bin/update_change_file_from_git_st.sh 2224 /d/src/prediction_service_conf /home/admin/zhangmaolin/src/prediction_service_conf
elif [ x$args = x"ps" ]; then
    echo "update ps bin"
    scp -P 2224 /d/src/prediction_service/src/prediction_service admin@localhost:/home/admin/zhangmaolin/prediction_run
elif [ x$args = x"bw" ]; then
    echo "update broadway jar"
    scp -P 2223 /d/src/broadway/target/broadway-1.3.0.jar admin@localhost:/export/Packages/broadway/latest/lib
elif [ x$args = x"si" ]; then
    echo "update sihub"
    scp -P 2223 /d/src/Mars-rankflow-recommender/target/mars-rankflow-recommender-1.0.2-SNAPSHOT.jar admin@localhost:/export/Packages/sihub/latest/lib
elif [ x$args = x"rec" ]; then
    echo "update rechub"
    scp -P 2223 /d/src/Mars-rankflow-recommender/target/mars-rankflow-recommender-1.0.2-SNAPSHOT.jar admin@localhost:/export/Packages/rechub/latest/lib
elif [ x$args = x"soa" ]; then
    echo "update base-soa"
#    scp -P 2223 /d/src/base-soa/soa/target/base-soa-1.0.5-SNAPSHOT.jar admin@localhost:/export/Packages/recproxy/latest/lib
    scp -P 2223 /d/src/base-soa/thriftzookeeper/thriftzookeeper-client/target/thriftzookeeper-client-1.1.6-SNAPSHOT.jar admin@localhost:/export/Packages/recproxy/latest/lib
elif [ x$args = x"proxy" ]; then
    echo "update recproxy"
    scp -P 2223 /d/src/recproxy/target/recproxy-0.1.jar admin@localhost:/export/Packages/recproxy/latest/lib
elif [ x$args = x"pssrc" ]; then
    echo "update ps source code"
    sh /d/bin/update_change_file_from_git_st.sh 2224 /d/src/prediction_service /home/admin/zhangmaolin/src/prediction_service
elif [ x$args = x"merger" ]; then
    echo "update merger_go source code"
    sh /d/bin/update_change_file_from_git_st.sh 2224 /d/src/merger_go /home/admin/zhangmaolin/src/merger_go
elif [ x$args = x"brpc" ]; then
    echo "update brpc source code"
    sh /d/bin/update_change_file_from_git_st.sh 2224 /d/opensource/brpc /home/admin/zhangmaolin/opensrc/brpc
elif [ x$args = x"searcher" ]; then
    echo "update searcher platform source code"
    sh /d/bin/update_change_file_from_git_st.sh 2224 /d/src/searchplatform/ /home/admin/zhangmaolin/src/searchplatform
    # scp -P 2224 -r /d/src/searchplatform/src admin@localhost:/home/admin/zhangmaolin/src/searchplatform/src
elif [ x$args = x"searcher2" ]; then
    echo "update searcher platform source code"
    sh /d/bin/update_change_file_from_git_st.sh 2225 /d/src/searchplatform/ /home/admin/zhangmaolin/src/searchplatform
    # scp -P 2224 -r /d/src/searchplatform/src admin@localhost:/home/admin/zhangmaolin/src/searchplatform/src
elif [ x$args = x"xapian" ]; then
    echo "update searcher platform source code"
    sh /d/bin/update_change_file_from_git_st.sh 2224 /d/src/search_xplib /home/admin/zhangmaolin/src/search_xplib
    # scp -P 2224 -r /d/src/searchplatform/src admin@localhost:/home/admin/zhangmaolin/src/searchplatform/src
else
    echo "the param is conf/ps/bw/si/rec/soa/pssrc/searcher/xapian"
fi
