reset;

set PROD; # products
param rate {PROD} > 0; 			# tons produced by hour
param avail >= 0;				# hours available in week

param profit {PROD};			# profit per ton
param market {PROD} >= 0;		# limit on tons sold in week

var Make {p in PROD} >= 0, <= market[p]; # tons produced
# Objective: total profits from all products
maximize Total_Profit: sum {p in PROD} profit[p] * Make[p];
# Constraint: total of hours used by all
# products may not exceed hours available
subject to Time: sum {p in PROD} (1 / rate[p]) * Make[p] <= avail;

# expand Time;
# 0.005*Make['bands'] + 0.00714286*Make['coils'] <= 40;

# expand Total_Profit;
# 25*Make['bands'] + 30*Make['coils'];

# expand Make['coils'];
# Coefficients of Make['coils']:
#	Time           0.00714286
#	Total_Profit  30