# Analysing Self-Adaptive Systems as Software Product Lines: A Case Study from Autonomous Underwater Robotics
This repository contains the implementation of a case study which uses software product lines to implement and analyse a self-adaptive system. The case study of an autonomous underwater vehicle with the mission to find and inspect a pipeline located on a seabed was inspired by the exemplar [SUAVE](https://arxiv.org/abs/2303.09220v1).

To run the model, [PRISM](https://www.prismmodelchecker.org/) and [ProFeat](https://wwwtcs.inf.tu-dresden.de/ALGI/PUB/ProFeat/doc/index.html) have to be installed. We recommend getting the newest version of PRISM and ProFeat from the respective Github repositories, the [PRISM Github repository](https://github.com/prismmodelchecker/prism) and the [ProFeat Github repository](https://github.com/pchrszon/profeat).

When both PRISM and ProFeat are installed, make them executable from anywhere or put them in the same folder. In the latter case, the commands below have to be run from the directory which includes the executables from PRISM and ProFeat. Then the file names have to include the path to these files. Below, we will assume that PRISM and ProFeat are executable from anywhere.

## Run the Case Study
To run the case study, navigate in the terminal to `spl_metacontrol`. Then type the following.
```Bash
profeat -t casestudy.profeat casestudy.fprops
prism out.prism out.props > out.log
```
The first command translates the ProFeat model and the ProFeat properties to PRISM model and property files, the second command uses PRISM to compute the results which are saved in the `out.log` file. To view the results, open the `out.log` file which is saved in the `spl_metacontrol` folder.

If you want to analyse additional properties, include them in the `casestudy.fprops` file. Remember to include `${...}` around ProFeat specific constructs.

## Change Scenarios
To change the scenario, open the file `casestudy.profeat`, uncomment parameters of the scenario you want to run and comment the parameters of the other scenario. If you, for example, want to run Scenario 1, the beginning of `casestudy.profeat` should look like this:
```
mdp

// Scenario 1: Short pipeline inspection in the North Sea
const int max_visib = 10;				// The maximum visibility
const int min_visib = 1;				// The minimum visibility
const double current_prob = 0.6;		// The probability of currents
const int inspect = 10;				    // The meters of pipeline that should be inspected

// Scenario 2: Longer pipeline inspection in the Caribbean Sea
//const int max_visib = 20;
//const int min_visib = 3;
//const double current_prob = 0.3;
//const int inspect = 30;
```
To create a new scenario, change the parameters `min_visib`, `max_visib`, `current_prob` and `inspect`.

## Replicate the PRISM experiments
To run the PRISM experiments, the file `out.prism`, obtained with the above commands, has to be modified such that the variables are initialised after their declaration and not in an `init ... endinit` block. The resulting files for Scenarios 1 and 2 can be found in the folder `experiments` as `scenario1.prism`, respectively `scenario2.prism`. The necessary property file is `experiments.props` in the same folder.

Open the PRISM GUI by opening the executable `xprism` that was downloaded when you downloaded PRISM. Open the model file of one of the two scenarios by going to `Model -> Open model` and selecting `scenario1.prism` or `scenario2.prism`. Parse and build the model by pressing `F2` and `F3` respectively. To load the properties, go to the `Properties` Tab in the lower left corner. Open the properties list by going to `Properties -> Open properties list` and select `experiments.props`. 

To run an experiment, click one of the properties and press `F7`. In the dialog that opens, first decide which range your parameter should have, i.e., how many time steps you want to consider, in the paper we display the graph with 40 time steps. Click on `Okay`, give the graph a name and either print it to an already existing graph or a new one.

### Run experiments with different parameters
To run experiments with different parameters, you can modify the values of `min_visib`, `max_visib`, `current_prob` and `inspect` in the file `scenario1.prism` or `scenario2.prism`. It is also possible to modify them in the `casestudy.profeat` file, translate the file a PRISM file as described above, and modify the resulting `out.prism` file such that the block `init ... endinit` is reflected in the declaration of the variables.

For more information about PRISM experiments, including how to run them from the command line, consult the [PRISM manual](https://www.prismmodelchecker.org/manual/RunningPRISM/Experiments).




## Additional Properties
We also analysed some properties that are not documented in the paper. The whole list of properties can be found in the file `casestudy_all.fprops`. To see their results, run
```Bash
profeat -t casestudy.profeat casestudy_all.fprops
prism out.prism out.props > out.log
```
The results will again be in the file `out.log`.

## Acknowledgements

<a href="https://remaro.eu/">
    <img height="60" alt="REMARO Logo" src="https://remaro.eu/wp-content/uploads/2020/09/remaro1-right-1024.png">
</a>

This work is part of the Reliable AI for Marine Robotics (REMARO) Project. For more information, please visit: <a href="https://remaro.eu/">https://remaro.eu/

<br>

<a href="https://research-and-innovation.ec.europa.eu/funding/funding-opportunities/funding-programmes-and-open-calls/horizon-2020_en">
    <img align="left" height="60" alt="EU Flag" src="https://remaro.eu/wp-content/uploads/2020/09/flag_yellow_low.jpg">
</a>

This project has received funding from the European Union's Horizon 2020 research and innovation programme under the Marie Skłodowska-Curie grant agreement No. 956200.