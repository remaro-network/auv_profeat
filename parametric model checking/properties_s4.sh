#!/bin/bash
touch results_s4.log
truncate -s 0 results_s4.log

echo "#################################### MINIMAL ENERGY ####################################\n" >> results_s4.log
echo "\n################## Minimal Energy, Min Direction ##################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"energy\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

echo "\n################## Minimal Energy, Max Direction #######################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"energy\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

echo "\n#################################### MAXIMAL ENERGY ####################################\n" >> results_s4.log
echo "\n################## Maximal Energy, Min Direction #######################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"energy\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

echo "\n################## Maximal Energy, Max Direction #######################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"energy\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

echo "\n#################################### MINIMAL TIME ####################################\n" >> results_s4.log
echo "\n################## Minimal Time, Min Direction #######################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

echo "\n################## Minimal Time, Max Direction #######################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

echo "\n#################################### MAXIMAL TIME ####################################\n" >> results_s4.log
echo "\n################## Maximal Time, Min Direction #######################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

echo "\n################## Maximal Time, Max Direction #######################\n" >> results_s4.log
~/Documents/Tools/storm/build/bin/storm-pars --prism five_altitudes_s4.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.001<=current_prob<=0.999" --guarantee 0.0001 abs >> results_s4.log

	