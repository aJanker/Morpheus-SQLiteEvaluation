#!/bin/sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)

filesToProcess() {
  local listFile=sqlite_files
  cat $listFile
}


flags=" --bdd --reuseAST  --study sqlite  --refEval extract --refLink $ABSPATH/sqlite/sqlite3.interface  --disablePC \
        -I /usr/local/include \
	        -I /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include-fixed \
		        -I /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include \
			        -I $ABSPATH \
				        -I $ABSPATH/sqlite \
        --platfromHeader $ABSPATH/platform.h \
        --openFeat $ABSPATH/openfeatures.txt \
        --featureModelFExpr $ABSPATH/fm.txt \
        --typeSystemFeatureModelDimacs $ABSPATH/sqlite.dimacs \
        --include $ABSPATH/partial_configuration.h \
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

