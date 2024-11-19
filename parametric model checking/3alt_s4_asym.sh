#!/bin/bash
touch ./results/scenario4/results_3alt_s4_asym.log
truncate -s 0 ./results/scenario4/results_3alt_s4_asym.log

echo "#################################### MINIMAL ENERGY ####################################\n" >> ./results/scenario4/results_3alt_s4_asym.log
echo "\n################## Minimal Energy, Min Direction ##################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"energy_3alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

echo "\n################## Minimal Energy, Max Direction #######################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"energy_3alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

echo "\n#################################### MAXIMAL ENERGY ####################################\n" >> ./results/scenario4/results_3alt_s4_asym.log
echo "\n################## Maximal Energy, Min Direction #######################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"energy_3alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

echo "\n################## Maximal Energy, Max Direction #######################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"energy_3alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

echo "\n#################################### MINIMAL TIME ####################################\n" >> ./results/scenario4/results_3alt_s4_asym.log
echo "\n################## Minimal Time, Min Direction #######################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

echo "\n################## Minimal Time, Max Direction #######################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

echo "\n#################################### MAXIMAL TIME ####################################\n" >> ./results/scenario4/results_3alt_s4_asym.log
echo "\n################## Maximal Time, Min Direction #######################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

echo "\n################## Maximal Time, Max Direction #######################\n" >> ./results/scenario4/results_3alt_s4_asym.log
storm-pars --prism ./models/scenario4/3alt_s4_asym.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.05<=current_prob<=0.5" --guarantee 0.0001 abs >> ./results/scenario4/results_3alt_s4_asym.log

	