%% THIS FUNCTION ALLOCATES BIAS COEFFICIENTS TO A CORRESPONDING VARIABLE
%  ONCE A BIAS COEFFICIENT IS GIVEN, IT WILL BE ALLOCATED TO ONE OF THE
%  SIXTEEN POSSIBLE OCCURENCES AS A COUNTER. THAT IS, FOR EXAMPLE, IF THE
%  VALUE OF AB19 IS 17, IT MEANS THERE HAVE BEEN 17 OCCURENCES OF (1,9)
%  WITHIN THE GIVEN RANGE.

function [aa11,ab13,ab17,ab19,ab31,aa33,ab37,...
    ab39,ab71,ab73,aa77,ab79,ab91,ab93,ab97,aa99]...
    = riemann_coefficient_allocation(Bias_Coefficient,aa11,...
    ab13,ab17,ab19,ab31,aa33,ab37,ab39,ab71,ab73,...
    aa77,ab79,ab91,ab93,ab97,aa99)

if Bias_Coefficient == 11
    aa11 = aa11 + 1;
elseif Bias_Coefficient == 13
    ab13 = ab13 + 1;
elseif Bias_Coefficient == 17
    ab17 = ab17 + 1;
elseif Bias_Coefficient == 19
    ab19 = ab19 + 1;
elseif Bias_Coefficient == 31
    ab31 = ab31 + 1;
elseif Bias_Coefficient == 33
    aa33 = aa33 + 1;
elseif Bias_Coefficient == 37
    ab37 = ab37 + 1;
elseif Bias_Coefficient == 39
    ab39 = ab39 + 1;
elseif Bias_Coefficient == 71
    ab71 = ab71 + 1;
elseif Bias_Coefficient == 73
    ab73 = ab73 + 1;
elseif Bias_Coefficient == 77
    aa77 = aa77 + 1;
elseif Bias_Coefficient == 79
    ab79 = ab79 + 1;
elseif Bias_Coefficient == 91
    ab91 = ab91 + 1;
elseif Bias_Coefficient == 93
    ab93 = ab93 + 1;
elseif Bias_Coefficient == 97
    ab97 = ab97 + 1;
elseif Bias_Coefficient == 99
    aa99 = aa99 + 1;
end


