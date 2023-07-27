## ADDING RESOURCE CONSTRAINTS TO THE MODEL
# To motivate a more general model, image that we divide production
# into a reheat stage that can process the incoming slabs at 200 tons 
# per hour, and a rolling stage that makes bands, coils or plate at the
# rates previously given.
# ====> 35 hours of reheat time | 40 hours of rolling time
# we can add a STAGE of productions stages

# in the Time constraint, the production rate for product p in stage s
# is referred to as rate[p, s] (double scripted)

# The only other change is to the constraint declaration, where 
# we no longer have a single constraint, but a constraint for 
# each stage, imposed by limited time available at that stage. 

set PROD;   # products
set STAGE;  # stages

param rate {PROD,STAGE} > 0; # tons per hour in each stage
param avail {STAGE} >= 0;    # hours available/week in each stage
param profit {PROD};         # profit per ton
param commit {PROD} >= 0;    # lower limit on tons sold in week
param market {PROD} >= 0;    # upper limit on tons sold in week

var Make {p in PROD} >= commit[p], <= market[p]; # tons produced
maximize Total_Profit: sum {p in PROD} profit[p] * Make[p];
               # Objective: total profits from all products
               
subject to Time {s in STAGE}:
   sum {p in PROD} (1/rate[p,s]) * Make[p] <= avail[s];
               # In each stage: total of hours used by all
               # products may not exceed hours available
               
               
# ampl: display Make.lb, Make, Make.ub, Make.rc;
#:     Make.lb    Make   Make.ub     Make.rc       :=
#bands   1000    3357.14   6000     3.55271e-15
#coils    500     500      4000    -1.85714
#plate    750    3142.86   3500     0
#;

# ampl: display Time;
# Time [*] :=
# reheat  1800
#  roll  3200
# ;

# We have displayed the "marginal values" (called dual values or shadow
# prices) associated with the Time constrain.

# The MARGINAL VALUE of a constraint measures how much the value of the
# objective would improve if the constraint were relaxed by a small 
# amount. For ex:
# additional reheat time would produce another $1800 of extra profit
# per hour, and additional rolling time would procude $3200 per hour.

# REDUCE COST: Make.rc -> has the same meaning with respect to the
# bounds that the marginal values have with respecto to the constraints.

# Thus we see that, again up to some point, each increase of a ton 
# in the lower bound (or commitment) for coil production should 
# reduce profits by about $1.86; each one-ton decrease in the 
# lower bound should improve profits by about $1.86.





