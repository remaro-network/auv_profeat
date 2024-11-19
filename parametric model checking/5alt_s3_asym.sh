#!/bin/bash
touch ./results/scenario3/results_5alt_s3_asym.log
truncate -s 0 ./results/scenario3/results_5alt_s3_asym.log

echo "#################################### MINIMAL ENERGY_3 ####################################\n" >> ./results/scenario3/results_5alt_s3_asym.log
echo "\n################## Minimal Energy_3, Min Direction ##################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_3alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n################## Minimal Energy_3, Max Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_3alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n#################################### MAXIMAL ENERGY_3 ####################################\n" >> ./results/scenario3/results_5alt_s3_asym.log
echo "\n################## Maximal Energy_3, Min Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_3alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n################## Maximal Energy_3, Max Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_3alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "#################################### MINIMAL ENERGY_5 ####################################\n" >> ./results/scenario3/results_5alt_s3_asym.log
echo "\n################## Minimal Energy_5, Min Direction ##################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_5alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n################## Minimal Energy_5, Max Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_5alt\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n#################################### MAXIMAL ENERGY_5 ####################################\n" >> ./results/scenario3/results_5alt_s3_asym.log
echo "\n################## Maximal Energy_5, Min Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_5alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n################## Maximal Energy_5, Max Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"energy_5alt\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n#################################### MINIMAL TIME ####################################\n" >> ./results/scenario3/results_5alt_s3_asym.log
echo "\n################## Minimal Time, Min Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n################## Minimal Time, Max Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"time\"}min=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n#################################### MAXIMAL TIME ####################################\n" >> ./results/scenario3/results_5alt_s3_asym.log
echo "\n################## Maximal Time, Min Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction min --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

echo "\n################## Maximal Time, Max Direction #######################\n" >> ./results/scenario3/results_5alt_s3_asym.log
storm-pars --prism ./models/scenario3/5alt_s3_asym.prism --prop "R{\"time\"}max=? [F _s = done]" --mode feasibility --feasibility:method pla --direction max --region "0.3<=current_prob<=0.8" --guarantee 0.0001 abs >> ./results/scenario3/results_5alt_s3_asym.log

	