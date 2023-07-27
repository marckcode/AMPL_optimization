# sets:
# parameters:
# variables:
# objective: maximized or minimized
# constraints: the solution must satisfy

# Given: 	P, a set of products
#			aj = tons per hour of product j, for each j ∈ P
#			b = hours available at the mill
#			cj = profit per ton of product j, for each j ∈ P
#			uj = maximum tons of product j, for each j ∈ P
# Define variables: Xj = tons of product j to be made, for each j ∈ P
# Maximize:
# 		Σcj Xj
# 		j ∈ P
# Subject to:
# 		Σ (1/aj) Xj ≤ b
# 		j ∈ P
# 		0 ≤ Xj ≤ uj, for each j ∈P
reset;
set P;

param a {j in P}; # theres is an aj for each j in P
# a is a collection of parameter values, one for each member of P
# aj = a[j]
param b; # scalar value
param c {j in P};
param u {j in P};
var X {j in P}; # collection of variables, one for each member of P
maximize Total_Profit: sum {j in P} c[j]*X[j]; # objective function
# constraints
# a certain sum over the set P may not exceed the value of parameter b
subject to Time: sum {j in P} (1/a[j]) * X[j] <= b;
# family of constraints, one for each member j of P
# {j in P} is a INDEXING EXPRESSION
subject to Limit {j in P}: 0 <= X[j] <= u[j];

# model prod.mod;
# data prod.dat;
# option solver MINOS;
# solve;
# display X;
