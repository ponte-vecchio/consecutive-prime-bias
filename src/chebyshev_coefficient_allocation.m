%% THIS FUNCTION ALLOCATES BIAS COEFFICIENTS TO A CORRESPONDING VARIABLE
%  ONCE A BIAS COEFFICIENT IS GIVEN, IT WILL BE ALLOCATED TO ONE OF THE
%  FOUR POSSIBLE OCCURENCES AS A COUNTER. THAT IS, FOR EXAMPLE, IF THE
%  VALUE OF THREE IS 17, IT MEANS THERE HAVE BEEN 17 OCCURENCES OF THE
%  NUMBER 3 WITHIN THE GIVEN RANGE.

function [one,three,seven,nine] = ...
    chebyshev_coefficient_allocation(Bias_Coefficient,one,three,...
    seven,nine)

if Bias_Coefficient == 1;
    one = one + 1;
elseif Bias_Coefficient == 3;
    three = three + 1;
elseif Bias_Coefficient == 7;
    seven = seven + 1;
elseif Bias_Coefficient == 9;
    nine = nine + 1;
end










