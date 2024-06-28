#!/bin/bash
touch ./results.log
truncate -s 0 ./results.log

echo "#################################### 3 ALTITUDES ####################################\n" >> ./results.log
echo "\n################## Achievability Query ##################\n" >> ./results.log
echo "\n########  Is it possible to achieve almost minimal time and energy at the same time? ########\n"  >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"time\"}<=23.8918 [ F _s=done ], R{\"energy_3alt\"}<=24.7845 [F _s = done])" >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"time\"}<=23.9 [ F _s=done ], R{\"energy_3alt\"}<=24.8 [F _s = done])" >> ./results.log

echo "\n################## Numerical Query ##################\n" >> ./results.log
echo "\n########  What is the minimal expected time such that the energy_3alt reward is below 24.7845 (approximately the minimal energy_3alt reward)? ########\n"  >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"time\"}min=?[ F _s=done ], R{\"energy_3alt\"}<=24.7845 [F _s = done])" >> ./results.log

echo "\n######## What is the maximal expected time such that the energy_3alt reward is below 24.7845 (approximately the minimal energy_3alt reward)? ########\n"  >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"time\"}max=?[ F _s=done ], R{\"energy_3alt\"}<=24.7845 [F _s = done])" >> ./results.log

echo "\n######## What is the minimal expected energy_3alt reward such that the time is below 23.8918 (approximately the minimal time reward)?########\n" >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"energy_3alt\"}min=? [F _s = done], R{\"time\"}<=23.8918 [ F _s=done ])" >> ./results.log

echo "\n######## What is the maximal expected energy_3alt reward such that the time is below 23.8918 (approximately the minimal time reward)?########\n" >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"energy_3alt\"}min=? [F _s = done], R{\"time\"}<=23.8918 [ F _s=done ])">> ./results.log

echo "\n################## Pareto Query ##################\n" >> ./results.log

echo "\n######## Pareto optimal ########\n" >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"time\"}min=?[ F _s=done ], R{\"energy_3alt\"}min=? [F _s = done])" >> ./results.log

echo "\n######## Pareto optimal ########\n" >> ./results.log
~/Documents/Tools/storm/build/bin/storm --prism ../experiments/non-parametric/scenario\ 1/3alt_s1_asym.prism  --prop "multi(R{\"time\"}min=?[ F _s=done ], R{\"energy_3alt\"}min=? [F _s = done])"  --multiobjective:exportplot plot/ >> ./results.log
