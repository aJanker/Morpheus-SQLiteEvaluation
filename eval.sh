#!/bin/sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)

filesToProcess() {
  local listFile=casestudy/sqlite_files
  cat $listFile
}


flags=" --bdd  --study sqlite  --refEval extract --disablePC \
        -I /usr/local/include \
        -I /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include-fixed \ 
        -I /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include \
        -I $ABSPATH \
        -I $ABSPATH/casestudy \
        -I $ABSPATH/sqlite \
        --platfromHeader $ABSPATH/casestudy/platform.h \
        --openFeat $ABSPATH/casestudy/openfeatures.txt \
        --featureModelFExpr $ABSPATH/casestudy/fm.txt \
        --typeSystemFeatureModelDimacs $ABSPATH/casestudy/sqlite.dimacs \
        --include $ABSPATH/casestudy/partial_configuration.h \
        --parserstatistics  "


filesToProcess|while read i; do
         echo "Analysing $ABSPATH/$i.c"
         echo "With settings: $flags"
         ../Morpheus/morpheus.sh $ABSPATH/sqlite$i.c $flags
         cd sqlite
	 ./build.sh
	 cd ..
	 cd TH3
	 ./runtest.sh
	 cd ..
         git checkout .
	 cd sqlite
         ./build.sh
         cd .. 
	 cd TH3
         ./runtest.sh 
         done

