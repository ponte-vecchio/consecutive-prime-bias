%% THIS FUNCTION SORTS THE DISTRIBUTION OF CONSECUTIVE PRIMES
%  THE DIGITS OF INTEREST ARE 1,3,7 AND 9 WHICH ARE MAJOR CONSECUTIVE
%  PRIMES. HOWEVER, 2 AND 5 ARE ALSO PRIME NUMBERS, BUT WILL BE TREATED AS
%  MINOR CONSECUTIVE PRIMES SINCE THE OCCURENCE OF A NUMBER ENDING WITH 2
%  OR 5 IS SINGULAR. HOWEVER, THE BIAS COEFFICIENT WILL TAKE ACCOUNT FOR
%  BOTH MAJOR AND MINOR CONSECUTIVE PRIMES.

function [Bias_Coefficient] = riemann_distribution_bias(First_Digit,Second_Digit)
%% DISTRIBUTION OF MAJOR CONSECUTIVE PRIMES (1,3,7,9)

% (a,b) where a = 1
if First_Digit == 1;
    if Second_Digit == 1;
        Bias_Coefficient = 11;
    elseif Second_Digit == 3;
        Bias_Coefficient = 13;
    elseif Second_Digit == 7;
        Bias_Coefficient = 17;
    elseif Second_Digit == 9;
        Bias_Coefficient = 19;
    end
end

% (a,b) where a = 3
if First_Digit == 3;
    if Second_Digit == 1;
        Bias_Coefficient = 31;
    elseif Second_Digit == 3;
        Bias_Coefficient = 33;
    elseif Second_Digit == 7;
        Bias_Coefficient = 37;
    elseif Second_Digit == 9;
        Bias_Coefficient = 39;
    end
end

% (a,b) where a = 7
if First_Digit == 7;
    if Second_Digit == 1;
        Bias_Coefficient = 71;
    elseif Second_Digit == 3;
        Bias_Coefficient = 73;
    elseif Second_Digit == 7;
        Bias_Coefficient = 77;
    elseif Second_Digit == 9;
        Bias_Coefficient = 79;
    end
end

% (a,b) where a = 9
if First_Digit == 9;
    if Second_Digit == 1;
        Bias_Coefficient = 91;
    elseif Second_Digit == 3;
        Bias_Coefficient = 93;
    elseif Second_Digit == 7;
        Bias_Coefficient = 97;
    elseif Second_Digit == 9;
        Bias_Coefficient = 99;
    end
end
end


