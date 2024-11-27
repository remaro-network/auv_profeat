# Feature-Oriented Modelling and Analysis of a Self-Adaptive Robotic System

This repository contains an extension of the case study of the conference paper "Formal Modelling and Analysis of a Self-Adaptive Robotic System" (published at iFM 2023) which can be found [here](https://link.springer.com/chapter/10.1007/978-3-031-47705-8_18). The model is used in the journal paper "Feature-Oriented Modelling and Analysis of a Self-Adaptive Robotic System" (submitted to Formal Aspects of Computing) by Juliane Päßler, Maurice H. ter Beek, Ferruccio Damiani, Clemens Dubslaff, Einar Broch Johnsen and S. Lizeth Tapia Tarifa.

The model is available on [zenodo](https://doi.org/10.5281/zenodo.14228090) and on [GitHub](https://github.com/remaro-network/auv_profeat/tree/parametric).


## Navigate the README
- [Set-up](#set-up)
- [Replication Instructions and Examples of Usage](#replication-instructions-and-examples-of-usage)
    - [Reward Properties](#reward-properties)
        - [Read the out.log File](#read-the-outlog-file)
        - [Change Scenarios](#change-scenarios)
        - [Change Environment Behaviour](#change-environment-behaviour)
    - [Unsafe State Experiments](#unsafe-states-experiments)
    - [Different Environments](#different-environments)
        - [Experiments with Scenario 4](#experiments-with-scenario-4)
    - [Reward Properties with Varying Current Probability](#reward-properties-with-varying-current-probability)
    - [Multi-Objective Queries](#multi-objective-queries)
    - [Additional Properties](#additional-properties)
- [Extend and Modify the Artifact](#extend-and-modify-the-artifact)
    - [PRISM Experiments](#prism-experiments)
        - [Run Experiments with Different Parameters](#run-experiments-with-different-parameters)
        - [Run Experiments with a Modified Model](#run-experiments-with-a-modified-model)
        - [Run Experiments with Other Properties](#run-experiments-with-other-properties)
- [Acknowledgements](#acknowledgements)

## Set-up
To run the model, [PRISM](https://www.prismmodelchecker.org/), [ProFeat](https://wwwtcs.inf.tu-dresden.de/ALGI/PUB/ProFeat/doc/index.html) and [Storm](https://www.stormchecker.org/) have to be installed. We recommend getting PRISM v4.7, ProFeat v1.0.2.1 (commit id dfa7f03214bb92e7fd30f1402ff5a19dbdd5929c) and Storm from the respective Github repositories, the [PRISM Github repository](https://github.com/prismmodelchecker/prism/tree/v4.7), the [ProFeat Github repository](https://github.com/pchrszon/profeat) and the [Storm Github repository](https://github.com/moves-rwth/storm).

When PRISM, ProFeat and Storm are installed, make them executable from anywhere or put them in the same folder. In the latter case, the commands below have to be run from the directory which includes the executables from PRISM, ProFeat and Storm. Then the file names have to include the path to these files. Below, we will assume that PRISM, ProFeat and Storm are executable from anywhere.

## Replication Instructions and Examples of Usage

All analysis results documented in the paper can be replicated with the artifact. We will show how to replicate the analysis results for the five-altitudes model. To replicate the analysis results for the three-altitudes model, it suffices to change `casestudy.profeat` to `casestudy_3altitudes.profeat` and `casestudy.fprops` to `casestudy_3altitudes.fprops` in the commands.

All analyses described here should take less than one minute.

### Reward Properties
To replicate the results for the reward properties reported in the Section "Reward Properties" of the paper (and of the safe states paragraph in the Section "Unsafe States"), first navigate to the folder `auv_profeat` in the terminal. 
Then type the following.
```Bash
profeat -t casestudy.profeat casestudy.fprops
prism out.prism out.props > out.log
```
The first command translates the ProFeat model and the ProFeat property files to PRISM model and property files, the second command uses PRISM to compute the results which are saved in the `out.log` file. To view the results, open the `out.log` file which is saved in the `auv_profeat` folder.

If you want to analyse additional properties, include them in the `casestudy.fprops` file. Remember to include `${...}` around ProFeat specific constructs.

#### Read the out.log File
The beginning of the `out.log` file should look like the following.
```Bash
PRISM
=====

Version: 4.7.dev
Date: xxx
Hostname: xxx
Memory limits: cudd=1g, java(heap)=1g
Command line: prism out.prism out.props

Parsing model file "out.prism"...

Type:        MDP
Modules:     _environment _auv _controller 
Variables:   _water_visib _s _d_insp _t_failed _robot_navigation_high _robot_navigation_low _robot_navigation_lowmed _robot_navigation_med _robot_navigation_medhigh _robot_pipeline_inspection_follow _robot_pipeline_inspection_search 

Parsing properties file "out.props"...

8 properties:
(1) filter(printall, Pmin=? [ F _s=done ], "init")
(2) filter(printall, R{"energy_3alt"}min=? [ F _s=done ], "init")
(3) filter(printall, R{"energy_3alt"}max=? [ F _s=done ], "init")
(4) filter(printall, R{"energy_5alt"}min=? [ F _s=done ], "init")
(5) filter(printall, R{"energy_5alt"}max=? [ F _s=done ], "init")
(6) filter(printall, R{"time"}min=? [ F _s=done ], "init")
(7) filter(printall, R{"time"}max=? [ F _s=done ], "init")
(8) filter(printall, Pmin=? [ G "safe" ], "init")
```
After a PRISM header, it specifies the model type, the modules and the variables of the PRISM file that was automatically translated from the ProFeat file. Then the analysed properties are listed. They are slightly different from the properties specified in `casestudy.fprops` because they have been translated to PRISM properties.

For each of the properties, the `out.log` file then includes a paragraph, separated by `----`, with the analysis results. For example, the paragraph for determining the minimum probability of finally reaching the state "done" should look like the following.
```Bash
---------------------------------------------------------------------

Model checking: filter(printall, Pmin=? [ F _s=done ], "init")

Building model...

Computing reachable states...

Reachability (BFS): 27 iterations in 0.01 seconds (average 0.000556, setup 0.00)

Time for model construction: 0.116 seconds.

Type:        MDP
States:      7660 (1 initial)
Transitions: 80344
Choices:     17320

Transition matrix: 16131 nodes (115 terminal), 80344 minterms, vars: 24r/24c/11nd

Prob0E: 25 iterations in 0.03 seconds (average 0.001320, setup 0.00)

Prob1A: 1 iterations in 0.00 seconds (average 0.001000, setup 0.00)

yes = 7660, no = 0, maybe = 0

Results (including zeros) for filter "init":
2860:(6,11,0,0,0,1,0,0,0,0,1)=1.0

Value in the initial state: 1.0

Time for model checking: 0.038 seconds.

Result: 1.0 (exact floating point)

---------------------------------------------------------------------
```
The result of the analyis (`Result`) can be found at the bottom of the paragraph, preceded by the time for model checking (`Time for model checking`).

#### Change Scenarios
To change the scenario, open the file `auv_profeat/casestudy.profeat`, uncomment parameters of the scenario you want to run and comment the parameters of the other scenario. If you, for example, want to run Scenario 2, the beginning of `casestudy.profeat` should look like this:
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

#### Change Environment Behaviour
To change the environment behaviour to the symmetric or asymmetric behaviour, you have to change the probabilities of increasing, decreasing and stagnant water visibility in the module `environment`. To do so, open the file `casestudy.profeat` (or `casestudy_3altitudes.profeat` if you want to use the three-altitudes model). Then change the module `environment`:

For the symmetric behaviour, the module should look as follows:
```Bash
module environment
	water_visib : [min_visib..max_visib] init round((max_visib-min_visib)/2);
	[step] true -> current_prob/2: (water_visib'= (water_visib=min_visib? min_visib : water_visib-1))
					+ current_prob/2: (water_visib'= (water_visib=max_visib? max_visib : water_visib+1))
                    + 1-current_prob: true;
endmodule
```

For the asymmetric behaviour, the module should look as follows:
```Bash
module environment
	water_visib : [min_visib..max_visib] init round((max_visib-min_visib)/2);
	[step] true -> current_prob: (water_visib'= (water_visib=min_visib? min_visib : water_visib-1))
					+ (1-current_prob)/2: (water_visib'= (water_visib=max_visib? max_visib : water_visib+1))
                    + (1-current_prob)/2: true;
endmodule
```

### Unsafe States Experiments
Here we show how to replicate the results for the unsafe states reported in the Section "Unsafe States" of the paper. 
The files for replicating the PRISM experiments for unsafe states for Scenarios 1 and 2 can be found in the folders `auv_profeat/experiments/non-parametric/scenario\ 1` and `auv_profeat/experiments/non-parametric/scenario\ 2`, respectively. The files in these folders are the PRISM models of the three-altitudes and five-altitudes case studies with symmetric and asymmetric environments. The file names reflect the model in the file: the file `Xalt_sY_ENV.prism` contains the model of the
- the X-altitude case study (where X is either 3 or 5)
- with Scenario Y (where Y is either 1 or 2) and
- environment behaviour ENV (where ENV is either sym for the symmetric environment behaviour or asym for the asymmetric environment behaviour).

The property files, containing the properties used for the experiments, for the three-altitudes and five-altitudes case studies are in the folder `auv_profeat/experiments/non-parametric` as `properties_3alt.props` and `properties_5alt.props`, respectively.

Open the PRISM GUI by opening the executable `xprism` that should have been downloaded when you downloaded PRISM. Open a model file of one of the two scenarios by going to `Model -> Open model` and selecting a model file `Xalt_sY_ENV.prism`. Parse and build the model by pressing `F2` and `F3` respectively. To load the properties, go to the `Properties` tab in the lower left corner. Open the properties list by going to `Properties -> Open properties list` and select either `properties_3alt.props` or `properties_5alt.props`, depending on the chosen model. 
The GUI should now look similar to the one below.
![xprism](images/xprism.png)
The experiments will use a variable named `k` for the number of time steps. To declare this variable, make a double click in the `Constants` field and change the name from `C0` to `k`.

To run an experiment, click one of the properties and press `F7`. In the dialog that opens, first decide which range your parameter should have, i.e., how many time steps you want to consider; in the paper we display the graph with 50 time steps. Click on `Okay`, give the graph a name and either print it to an already existing graph or to a new one.

It is also possible to inspect the values that were calculated for the graph. To do that, in the `Experiments` part of xprism, do a right click on the property whose results you want to inspect and click on `View results` as shown in the picture below.
![results](images/results.png)
This will enable you to determine after how many time steps the probability for the respective property to be satisfied is above a certain threshold. In this way we for example determined that the probability of reaching a safe state from an unsafe state is above 0.95 after 5 time steps for the two models in both scenarios and environments.

For more information about PRISM experiments, including how to run them from the command line, consult the [PRISM manual](https://www.prismmodelchecker.org/manual/RunningPRISM/Experiments).

### Different Environments
Here we show how to replicate the results reported in the Section "Different Environments" concerning different environments.
The files for replicating the PRISM experiments for parametric current probability for Scenario 3 can be found in the folder `auv_profeat/experiments/parametric/scenario\ 3`. The files are named as described in [Unsafe States Experiments](#unsafe-states-experiments). The property files used for these experiments are in the folder `auv_profeat/experiments/parametric` as `five_altitudes.props` and `three-altitudes.props` for the five-altitudes and three-altitudes model, respectively.

Conducting the experiments is similar to the procedure described in [Unsafe States Experiments](#unsafe-states-experiments):
Open the PRISM GUI by opening the executable `xprism` that should have been downloaded when you downloaded PRISM. Open a model file of one of the two scenarios by going to `Model -> Open model` and selecting a model file `Xalt_sY_ENV.prism`. Parse the model by pressing `F2`. You will notice that it's not possible to build the model by pressing `F3` because there was no value assigned to the variable `current_prop` (because we want to do experiments with differnt values for `current_prob`). If you pressed `F3` anyway, click `Cancel` in the opened dialog.
To load the properties, go to the `Properties` tab in the lower left corner. Open the properties list by going to `Properties -> Open properties list` and select either `five_altitudes.props` or `three_altitudes.props`, depending on the chosen model. 

To run an experiment, click one of the properties and press `F7`. In the dialog that opens, you have to specify the range of the variable `current_prob`. Select that you want to specify a range of values and specify that they should be from 0 to 1 with your desired step size. In the paper, we chose a step size of 0.01.
Click on `Okay`, give the graph a name and either print it to an already existing graph or to a new one.

#### Experiments with Scenario 4
If you want to run the experiments with Scenario 4, you can create the files yourself. To do so, change the scenario to Scenario 4 as described in [Change Scenarios](#change-scenarios) and change the environment to the one you want to analyse as described in [Change Environment Behaviour](#change-environment-behaviour).
Then run
```Bash
profeat -t casestudy.profeat casestudy.fprops
```
to translate the ProFeat model to a PRISM model (for translating the three-altitudes model, substitute `casestudy_3altitudes` for `casestudy` in both files). You find the translated model in the `out.prism` file and the translated properties in the `out.props` file. Then do the same as described for Scenario 3. 

### Reward Properties with Varying Current Probability  
Here we show how to replicate the results reported in the Section "Reward Properties with Varying Current Probability". The analyses reported before used PRISM, in this section and the next, we will use Storm.

The commands for parametric model checking in the three-altitudes and five-altitudes models using Scenarios 3 and 4 with symmetric and asymmetric environment behaviour have been collected in bash files is in the folder `auv_profeat/parametric\ model\ checking/`. The files are named as described in [Unsafe States Experiments](#unsafe-states-experiments).

To run the analysis, open a terminal and navigate to the folder `auv_profeat/parametric\ model\ checking/`. Then execute a bash file and obtain the results in the folder `auv_profeat/parametric\ model\ checking/results`.

### Multi-Objective Queries
Here we show how to replicate the results reported in the Section "Multi-Objective Queries". The analysis was again done with Storm and the commands reported in the paper have been collected in a bash file called `multi-objective.sh` in the folder `auv_profeat/multi-objective`. To run the analysis, open a terminal and navigate to the folder `auv_profeat/multi-objective`. Then execute the bash file `multi-objective.sh`, the results will be safed in a file `results.log` in the same folder.

### Additional Properties
We also analysed some properties that are not documented in the paper. The whole list of properties can be found in the file `auv_profeat/casestudy_all.fprops`. To see their results, run
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

#### Run Experiments with Different Parameters
To run experiments with different parameters, changing the influence a thruster failure has on the path of the AUV or introducing a different scenario, you can modify the values of `infl_tf`, `min_visib`, `max_visib`, `current_prob` and `inspect` in the file `scenario1.prism` or `scenario2.prism`. 

#### Run Experiments with a Modified Model
To run the PRISM experiments with a modified model, first run the analysis with the modified model as described in [Reward Properties](#reward-properties). The obtained file `out.prism`, has to be modified such that the PRISM variables are initialised after their declaration and not in an `init ... endinit` block. 
That is, the block
```Bash
init
    ((((((((1 <= (((_robot_navigation_high + _robot_navigation_low) + _robot_navigation_lowmed) + _robot_navigation_med) + _robot_navigation_medhigh & (((_robot_navigation_high + _robot_navigation_low) + _robot_navigation_lowmed) + _robot_navigation_med) + _robot_navigation_medhigh <= 1) & (1 <= _robot_pipeline_inspection_follow + _robot_pipeline_inspection_search & _robot_pipeline_inspection_follow + _robot_pipeline_inspection_search <= 1)) & (_robot_pipeline_inspection_follow = 1 => _robot_navigation_low = 1)) & _robot_navigation_low_active) & _robot_pipeline_inspection_search_active) & _d_insp = 0) & _s = start_task) & _t_failed = 0) & _water_visib = round((max_visib - min_visib) / 2)
endinit
```
has to be deleted and the initial values of the variables have to be inserted at the correct positions in the `out.prism` file. For the five-altitudes model it should look like the following (in the three-altitudes model, you don't need the variables `_robot_navigation_lowmed` and `_robot_navigation_medhigh`):
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
    _robot_navigation_lowmed : [0 .. 1] init 0;
    _robot_navigation_med : [0 .. 1] init 0;
    _robot_navigation_medhigh : [0 .. 1] init 0;
    _robot_pipeline_inspection_follow : [0 .. 1] init 0;
    _robot_pipeline_inspection_search : [0 .. 1] init 1;
... 
```
where `init` is the keyword for initialising a variable. 
Note that the variables of the ProFeat model have a preceding `_` in the PRISM model.

In the above example, the water visibility is initialised with `round((max_visib-min_visib)/2)`, and the initial value of state `s` is `11`, which corresponds to the state `start_task`. The variables `d_insp` and `t_failed` are both initialised with `0`.

The features of the feature model that can be activated and deactivated during runtime are represented as variables in the PRISM model. The variable `_robot_navigation_high` in the above example, for example, corresponds to the feature `high` which is a subfeature if `navigation` that is a subfeature of `robot`. The "feature variables" initialised with `0` are inactive in the beginning, the ones initialised with `1` are active.

#### Run Experiments with Other Properties
To run PRISM experiments with different properties, run the commands in [Reward Properties](#reward-properties) with your modified property file to obtain the corresponding `.props` file. Then follow the steps for replicating the experiments in [Different Environments](#different-environments) or [Unsafe States Experiments](#unsafe-states-experiments).

## Acknowledgements
We would like to thank Matthias Volk and Tim Quatmann for answering various questions about Storm and multiobjective model checking.

<a href="https://remaro.eu/">
    <img height="60" alt="REMARO Logo" src="https://remaro.eu/wp-content/uploads/2020/09/remaro1-right-1024.png">
</a>

This work is part of the Reliable AI for Marine Robotics (REMARO) Project. For more information, please visit: <a href="https://remaro.eu/">https://remaro.eu/

<br>

<a href="https://research-and-innovation.ec.europa.eu/funding/funding-opportunities/funding-programmes-and-open-calls/horizon-2020_en">
    <img align="left" height="60" alt="EU Flag" src="https://remaro.eu/wp-content/uploads/2020/09/flag_yellow_low.jpg">
</a>

This project has received funding from the European Union's Horizon 2020 research and innovation programme under the Marie Skłodowska-Curie grant agreement No. 956200.