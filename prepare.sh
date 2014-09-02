#!/bin/sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)

filesToProcess() {
  local listFile=casestudy/sqlite_files
  cat $listFile
}


flags=" --bdd  --study sqlite --refPrep  --disablePC \
	-I /usr/local/include \
        -I /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed \
        -I /usr/lib/gcc/x86_64-linux-gnu/4.6/include \
        -I /usr/include/x86_64-linux-gnu \
        -I /usr/include \       
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
         done

