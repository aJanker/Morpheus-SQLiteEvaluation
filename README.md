Morpheus-SQLiteEvaluation
===========================

This project contains all evaluation-related files for the SQLite case study using the variability-aware C refactoring engine [Morpheus](https://github.com/joliebig/Morpheus).


Installation and Usage
----------------------

To run this case study a version of [Morpheus](https://github.com/joliebig/Morpheus) is required. See the project page for installation notes.

Run the Evaluation
-----------------

If you want to start the SQLite evaluation of the refactoring engine [Morpheus](https://github.com/joliebig/Morpheus) run `prepare.sh` first to create the required .tunit, .interface and .pr files. Now you can edit `eval.sh` to choose your desired refactoring method: rename, extract- or inline function and subsequently run `./eval.sh` to execute the evalution.

Note: The used TH3 test suite is not included in this project as a valid licence is required. See (http://sqlite.org/th3) for further details.

Run the experimental GUI
-----------------

In order to show a GUI and refactor a single file of this case study "ide-like" just execute `./run.sh sqlite/sqlite3.c`.


Good luck. In case of problems contact Good luck. In case of problems contact [me](mailto:janker@fim.uni-passau.de).

License
-------

This case study is published as open source under LGPL 3.0. See [LICENSE](LICENSE.md).
The included source code of [SQLite](http://www.sqlite.org/) is published as public domain.
