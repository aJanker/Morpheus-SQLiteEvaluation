#!/bin/sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)
flags=" --bdd --showGui --disablePC \
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
 


echo "Starting Morpheus: "
echo "With settings: $flags"

../Morpheus/morpheus.sh $ABSPATH/sqlite/sqlite3.c $flags
