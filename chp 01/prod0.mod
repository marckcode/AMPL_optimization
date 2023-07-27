# Most common opplications of linear programming:
# maximizing the profit of some operations, subject to constraints
# that limit what can be produced.


reset;
var XB;
var XC;
maximize Profit: 25 * XB + 30 * XC;
subject to Time: (1/200) * XB + (1/140) * XC <= 40;
subject to B_limit: 0 <= XB <= 6000;
subject to C_limit: 0 <= XC <= 4000;

# model prod0.mod;
# option solver MINOS;
# solve;
# display XB, XC;
# quit;