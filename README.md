# Software product lines and Metacontrol
This repository includes a [PRISM](https://www.prismmodelchecker.org/) and [ProFeat](https://wwwtcs.inf.tu-dresden.de/ALGI/PUB/ProFeat/) model of use case developed for the exemplar [SUAVE](https://github.com/kas-lab/suave).

To run the model, [PRISM](PRISM) and [ProFeat](https://wwwtcs.inf.tu-dresden.de/ALGI/PUB/ProFeat/doc/installation.html) have to be installed.

**Note:** When using an M1 Mac, please pull the PRISM [GitHub repository](https://github.com/prismmodelchecker/prism) and follow the instructions there.

Move the PRISM and ProFeat executables to the same folder. To run a ProFeat model on a Mac, first navigate to the folder with the PRISM and ProFeat executables in the terminal. ProFeat must be run with a model (`.profeat`) file and a file containing the properties that should be checked (`.fprops`).
Assuming that the repository was cloned on the Desktop, do the following to run the use case.
```Bash
./profeat -t ~/Desktop/spl_metacontrol/profeat/usecase.profeat ~/Desktop/profeat/usecase.fprops
./prism out.prism out.props > out.log
./profeat ~/Desktop/spl_metacontrol/profeat/usecase.profeat ~/Desktop/profeat/usecase.fprops --import-results out.log
```
