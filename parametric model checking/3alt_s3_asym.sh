#!/bin/bash
touch ./results/scenario3/results_3alt_s3_asym.log
truncate -s 0 ./results/scenario3/results_3alt_s3_asym.log

echo "#################################### MINIMAL ENERGY ####################################\n" >> ./results/scenario3/results_3alt_s3_asym.log
echo "\n################## Minimal Energy, Min Direction ##################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"energy_3alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

echo "\n################## Minimal Energy, Max Direction #######################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"energy_3alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

echo "\n#################################### MAXIMAL ENERGY ####################################\n" >> ./results/scenario3/results_3alt_s3_asym.log
echo "\n################## Maximal Energy, Min Direction #######################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"energy_3alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

echo "\n################## Maximal Energy, Max Direction #######################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"energy_3alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

echo "\n#################################### MINIMAL TIME ####################################\n" >> ./results/scenario3/results_3alt_s3_asym.log
echo "\n################## Minimal Time, Min Direction #######################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

echo "\n################## Minimal Time, Max Direction #######################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

echo "\n#################################### MAXIMAL TIME ####################################\n" >> ./results/scenario3/results_3alt_s3_asym.log
echo "\n################## Maximal Time, Min Direction #######################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

echo "\n################## Maximal Time, Max Direction #######################\n" >> ./results/scenario3/results_3alt_s3_asym.log
storm-pars --prism ./models/scenario3/3alt_s3_asym.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_3alt_s3_asym.log

	