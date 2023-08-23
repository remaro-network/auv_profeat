# Formal Modelling and Analysis of a Self-Adaptive Robotic System (Artifact)

This repository contains the implementation of a case study of an autonomous underwater vehicle with the mission to find and inspect a pipeline located on a seabed which was inspired by the exemplar [SUAVE](https://arxiv.org/abs/2303.09220v1).

The goal of this artifact is to show how a self-adaptive system can be modelled and analysed with a probabilistic, feature guarded transition system and a controller switching between features. [ProFeat](https://pchrszon.github.io/profeat/) is used as a tool to show this approach. The artifact accompanies the paper "Formal Modelling and Analysis of a Self-Adaptive Robotic System" that will be published in the proceedings of [iFM 2023](https://liacs.leidenuniv.nl/~bonsanguemm/ifm23/).

The corresponding Github repository for this artifact can be found [here](https://github.com/remaro-network/auv_profeat/tree/ifm_artifact).

**Authors:** Juliane Päßler, Maurice H. ter Beek, Ferruccio Damiani, S. Lizeth Tapia Tarifa, Einar Broch Johnsen

**Artifact for the paper:** Formal Modelling and Analysis of a Self-Adaptive Robotic System

**How to cite the artifact:** 
```Bash
@INPROCEEDINGS{,
  author={Päßler, Juliane and ter Beek, Maurice H. and Damiani, Ferruccio and Tarifa, S. Lizeth Tapia and Johnsen, Einar Broch},
  booktitle={}, 
  title={Formal Modelling and Analysis of a Self-Adaptive Robotic System}, 
  year={2023},
  volume={},
  number={},
  pages={},
  doi={}
```

## Navigate the README
- [Set-up](#set-up)
- [Hardware Requirements](#hardware-requirements)
- [Test Instructions](#test-instructions)
- [Replication Instructions and Examples of Usage](#replication-instructions-and-examples-of-usage)
    - [Run the Analysis](#run-the-analysis)
    - [Read the out.log File](#read-the-outlog-file)
    - [Change Scenarios](#change-scenarios)
    - [Replicate the PRISM Experiments](#replicate-the-prism-experiments)
    - [Additional Properties](#additional-properties)
- [Extend and Modify the Artifact](#extend-and-modify-the-artifact)
    - [PRISM Experiments](#prism-experiments)
- [Acknowledgements](#acknowledgements)

## Set-up
To set up the artifact, safe the .zip file in your home directory and run the following.
```Bash
unzip auv_profeat.zip
cd ~/prism
./install.sh
```

## Hardware Requirements
The artifact can be evaluated using the default configuration of the [iFM-2023 virtual machine](https://zenodo.org/record/7782241): 4 cores, 8GB main memory.

## Test Instructions
To check that PRISM is properly installed, run
```Bash
~/prism/bin/prism
```
The output should look like the following
```Bash
PRISM
=====

Version: 4.7.dev
Date: Wed Aug 16 11:22:33 CEST 2023
Hostname: eduroam-193-157-252-57.wlan.uio.no
Memory limits: cudd=1g, java(heap)=1g
Command line: prism
Usage: prism [options] <model-file> [<properties-file>] [more-options]

For more information, type: prism -help
```

To test ProFeat, run the first replication instructions in [Run the Analysis](#run-the-analysis) and see if you get an error.

## Replication Instructions and Examples of Usage

All analysis results documented in the paper can be replicated with the artifact. The results for the properties without experiments for Scneario 1 can be replicated by running the commands in [Run the Analysis](#run-the-analysis). To replicate the results for Scenario 2, the scenario has to be changed as described in [Change Scenarios](#change-scenarios) before running the commands in [Run the Analysis](#run-the-analysis). To replicate the results for unsafe states with PRISM experiments, follow the instructions in [Replicate the PRISM Experiments](#replicate-the-prism-experiments). 

All analyses described here should take less than one minute.

If you did not set up the artifact yet, save it in your home directory and run the following to unzip the artifact and prepare it for running.
```Bash
unzip auv_profeat.zip
cd ~/prism
./install.sh
```

### Run the Analysis
To replicate the results for the properties without experiments, navigate to `auv_profeat` in the terminal. 
```Bash
cd ~/auv_profeat
```
Then type the following.
```Bash
~/profeat/bin/profeat -t casestudy.profeat casestudy.fprops
~/prism/bin/prism out.prism out.props > out.log
```
The first command translates the ProFeat model and the ProFeat property files to PRISM model and property files, the second command uses PRISM to compute the results which are saved in the `out.log` file. To view the results, open the `out.log` file which is saved in the `auv_profeat` folder.

If you want to analyse additional properties, include them in the `casestudy.fprops` file. Remember to include `${...}` around ProFeat specific constructs.

### Read the out.log File
The beginning of the `out.log` file should look like the following.
```Bash
PRISM
=====

Version: 4.7.dev
Date: Wed Aug 16 13:16:26 CEST 2023
Hostname: eduroam-193-157-252-57.wlan.uio.no
Memory limits: cudd=1g, java(heap)=1g
Command line: prism out.prism out.props

Parsing model file "out.prism"...

Type:        MDP
Modules:     _environment _auv _controller 
Variables:   _water_visib _s _d_insp _t_failed _robot_navigation_high _robot_navigation_low _robot_navigation_med _robot_pipeline_inspection_follow _robot_pipeline_inspection_search 

Parsing properties file "out.props"...

6 properties:
(1) filter(printall, Pmin=? [ F _s=done ], "init")
(2) filter(printall, R{"energy"}min=? [ F _s=done ], "init")
(3) filter(printall, R{"energy"}max=? [ F _s=done ], "init")
(4) filter(printall, R{"time"}min=? [ F _s=done ], "init")
(5) filter(printall, R{"time"}max=? [ F _s=done ], "init")
(6) filter(printall, Pmin=? [ G "safe" ], "init")
```
After a PRISM header, it specifies the model type, the modules and the variables of the PRISM file that was automatically translated from the ProFeat file. Then the analysed properties are listed. They are slightly different from the properties specified in `casestudy.fprops` because they have been translated to PRISM properties.

For each of the properties, the `out.log` file then includes a paragraph, separated by `----`, with the analysis results. For example, the paragraph for determining the minimum probability of finally reaching the state "done" should look like the following.
```Bash
---------------------------------------------------------------------

Model checking: filter(printall, Pmin=? [ F _s=done ], "init")

Building model...

Computing reachable states...

Reachability (BFS): 27 iterations in 0.01 seconds (average 0.000259, setup 0.00)

Time for model construction: 0.047 seconds.

Type:        MDP
States:      5580 (1 initial)
Transitions: 40904
Choices:     8300

Transition matrix: 6955 nodes (99 terminal), 40904 minterms, vars: 21r/21c/8nd

Prob0E: 25 iterations in 0.01 seconds (average 0.000560, setup 0.00)

Prob1A: 1 iterations in 0.00 seconds (average 0.000000, setup 0.00)

yes = 5580, no = 0, maybe = 0

Results (including zeros) for filter "init":
2460:(6,11,0,0,0,1,0,0,1)=1.0

Value in the initial state: 1.0

Time for model checking: 0.018 seconds.

Result: 1.0 (exact floating point)

---------------------------------------------------------------------
```
The result of the analyis (`Result`) can be found at the bottom of the paragraph, preceded by the time for model checking (`Time for model checking`).

### Change Scenarios
To change the scenario, open the file `~/auv_profeat/casestudy.profeat`, uncomment parameters of the scenario you want to run and comment the parameters of the other scenario. If you, for example, want to run Scenario 2, the beginning of `casestudy.profeat` should look like this:
```
mdp

const int infl_tf = 10;				// The influence a thruster failure has on the path of the AUV. The bigger the value, the less influence a thruster failure has on the path (it can keep the path even in case of a thruster failure)

// Scenario 1: Short pipeline inspection in the North Sea
//const int max_visib = 10;				// The maximum visibility
//const int min_visib = 1;				// The minimum visibility
//const double current_prob = 0.6;		// The probability of currents
//const int inspect = 10;				    // The meters of pipeline that should be inspected

// Scenario 2: Longer pipeline inspection in the Caribbean Sea
const int max_visib = 20;
const int min_visib = 3;
const double current_prob = 0.3;
const int inspect = 30;
```
To create a new scenario, change the parameters `min_visib`, `max_visib`, `current_prob` and `inspect`. You can also change the influence the thruster failures have on the path of the AUV by changing `infl_tf`.

### Replicate the PRISM Experiments
The files for replicating the PRISM experiments for Scenarios 1 and 2 can be found in the folder `~/auv_profeat/experiments` as `scenario1.prism`, respectively `scenario2.prism`. The necessary property file, containing the properties used for the experiments, is `experiments.props` in the same folder.

Open the PRISM GUI by opening the executable `xprism` in the folder `~/prism/bin`. Open the model file of one of the two scenarios by going to `Model -> Open model` and selecting `scenario1.prism` or `scenario2.prism`. Parse and build the model by pressing `F2` and `F3` respectively. To load the properties, go to the `Properties` Tab in the lower left corner. Open the properties list by going to `Properties -> Open properties list` and select `experiments.props`. 

To run an experiment, click one of the properties and press `F7`. In the dialog that opens, first decide which range your parameter should have, i.e., how many time steps you want to consider; in the paper we display the graph with 80 time steps. Click on `Okay`, give the graph a name and either print it to an already existing graph or to a new one.

For more information about PRISM experiments, including how to run them from the command line, consult the [PRISM manual](https://www.prismmodelchecker.org/manual/RunningPRISM/Experiments).

### Additional Properties
We also analysed some properties that are not documented in the paper. The whole list of properties can be found in the file `~/auv_profeat/casestudy_all.fprops`. To see their results, run
```Bash
profeat -t casestudy.profeat casestudy_all.fprops
prism out.prism out.props > out.log
```
The results will again be in the file `out.log`.


## Extend and Modify the Artifact
The artifact can be modified and extended in different ways, some ideas are collected below.
- Explore new scenarios.
- Analyse different properties.
- Change the probabilites of the transitions.
- Introduce different environmental or internal parameters that can trigger adaptation, i.e., feature changes by the feature controller.
- Include new modules. This would probably also entail modifying or extending the synchronisation between the different modules and extending the feature controller.
- Make the feature model richer, including more functionalities of the AUV that can be changed during runtime. This would also include extending both the module for the AUV and the feature controller.
- Include new states in the AUV module, representing for example another task that the AUV has to do. This might also require extending the feature controller.


### PRISM Experiments
In the following, we describe how to run the PRISM experiments with modified parameters, a modified model, as well different properties.

#### Run experiments with different parameters
To run experiments with different parameters, changing the influence a thruster failure has on the path of the AUV or introducing a different scenario, you can modify the values of `infl_tf`, `min_visib`, `max_visib`, `current_prob` and `inspect` in the file `scenario1.prism` or `scenario2.prism`. 

#### Run experiments with a modified model
To run the PRISM experiments with a modified model, first run the analysis with the modified model as described in [Run the Analysis](#run-the-analysis). The obtained file `out.prism`, has to be modified such that the PRISM variables are initialised after their declaration and not in an `init ... endinit` block. 
That is, the block
```Bash
init
    ((((((((1 <= (_robot_navigation_high + _robot_navigation_low) + _robot_navigation_med & (_robot_navigation_high + _robot_navigation_low) + _robot_navigation_med <= 1) & (1 <= _robot_pipeline_inspection_follow + _robot_pipeline_inspection_search & _robot_pipeline_inspection_follow + _robot_pipeline_inspection_search <= 1)) & (_robot_pipeline_inspection_follow = 1 => _robot_navigation_low = 1)) & _robot_navigation_low_active) & _robot_pipeline_inspection_search_active) & _d_insp = 0) & _s = start_task) & _t_failed = 0) & _water_visib = round((max_visib - min_visib) / 2)
endinit
```
has to be deleted and the initial values of the variables have to be inserted at the correct positions in the `out.prism` file. For the model used in this artifact, it should look like the following.
```Bash
... 
module _environment
    _water_visib : [min_visib .. max_visib] init round((max_visib-min_visib)/2);
... 
module _auv
    _s : [0 .. 12] init 11;
    _d_insp : [0 .. inspect] init 0;
    _t_failed : [0 .. infl_tf] init 0;
... 
module _controller
    _robot_navigation_high : [0 .. 1] init 0;
    _robot_navigation_low : [0 .. 1] init 1;
    _robot_navigation_med : [0 .. 1] init 0;
    _robot_pipeline_inspection_follow : [0 .. 1] init 0;
    _robot_pipeline_inspection_search : [0 .. 1] init 1;
... 
```
where `init` is the keyword for initialising a variable. 
Note that the variables of the ProFeat model have a preceding `_` in the PRISM model.

In the above example, the water visibility is initialised with `round((max_visib-min_visib)/2)`, and the initial value of state `s` is `11`, which corresponds to the state `start_task`. The variables `d_insp` and `t_failed` are both initialised with `0`.

The features of the feature model that can be activated and deactivated during runtime are represented as variables in the PRISM model. The variable `_robot_navigation_high` in the above example, for example, corresponds to the feature `high` which is a subfeature if `navigation` that is a subfeature of `robot`. The "feature variables" initialised with `0` are inactive in the beginning, the ones initialised with `1` are active.

#### Run experiments with other properties
To run PRISM experiments with different properties, run the commands in [Run the Analysis](#run-the-analysis) with your modified property file to obtain the corresponding `.props` file. The ProFeat property file used for the experiments in the paper can be found in `~/auv_profeat/experiments` as `casestudy_experiments.fprops` in case you want to use it as a template. Then follow the steps for replicating the experiments in [Replicate the PRISM Experiments](#replicate-the-prism-experiments).

## Acknowledgements
We would like to thank Clemens Dubslaff for explaining ProFeat and its usage to us, and for answering numerous questions. Furthermore, we would like to thank Rudolf Schlatte for his help in preparing the artifact for the final artifact submission.

<a href="https://remaro.eu/">
    <img height="60" alt="REMARO Logo" src="https://remaro.eu/wp-content/uploads/2020/09/remaro1-right-1024.png">
</a>

This work is part of the Reliable AI for Marine Robotics (REMARO) Project. For more information, please visit: <a href="https://remaro.eu/">https://remaro.eu/

<br>

<a href="https://research-and-innovation.ec.europa.eu/funding/funding-opportunities/funding-programmes-and-open-calls/horizon-2020_en">
    <img align="left" height="60" alt="EU Flag" src="https://remaro.eu/wp-content/uploads/2020/09/flag_yellow_low.jpg">
</a>

This project has received funding from the European Union's Horizon 2020 research and innovation programme under the Marie Skłodowska-Curie grant agreement No. 956200.