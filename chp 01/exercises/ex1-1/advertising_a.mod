# This exercise starts with a two-variable linear program:

# a) You are in charge of an advertising campaign for a new product, with a 
# budget of $1 million. You can advertise on TV or in magazines.
# One minute of TV time costs $20,000 and reaches 1.8
# million potential customers; a magazine page costs $10,000 
# and reaches 1 million. 
# You must sign up for at least 10 minutes of TV time. 
# How should you spend your budget to maximize your audience? 
# Formulate the problem in AMPL and solve it. 
reset;

# variables
var At >= 10; # minutes in TV
var Am >= 0; # magazine ads

# number of audience
maximize Audience: 1800000 * At + 1000000 * Am;

# budget is 1 million usd
subject to Budget: 20000 * At + 10000 * Am <= 1000000;

# only tv ads had a lower limit (10mins).
# higher limits are redundant.
subject to TV_limit: At <= 50; # 1 000 000 / 20 000 = 50 minutes
subject to MAG_limit: Am <= 100; # 1 000 000 / 10 000 = 100 pages


# model advertising_a.mod;
# option solver MINOS;
# solve;
# display At, Am;
