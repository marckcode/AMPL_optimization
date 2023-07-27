reset;

set PROD; # products
param rate {PROD} > 0; 			# tons produced by hour
param avail >= 0;				# hours available in week
param profit {PROD};			# profit per ton

param commit {PROD} >= 0; 		# lower limit on tons sold in week
param market {PROD} >= 0;		# upper limit on tons sold in week

var Make {p in PROD} >= commit[p], <= market[p]; # tons produced
# Objective: total profits from all products
maximize Total_Profit: sum {p in PROD} profit[p] * Make[p];
# Constraint: total of hours used by all
# products may not exceed hours available
subject to Time: sum {p in PROD} (1 / rate[p]) * Make[p] <= avail;