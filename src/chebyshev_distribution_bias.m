%% THIS FUNCTION SORTS THE DISTRIBUTION OF PRIMES USING CHEBYSHEV MODEL
%  THE DIGITS OF INTEREST ARE 1,3,7 AND 9. THERE ARE NO MAJOR OR MINOR
%  PRIMES SINCE CHEBYSHEV MODEL DOES NOT COMPARED TWO DIGITS. THIS MODEL
%  ONLY LOOKS AT THE OCCURENCE OF A DIGIT AS PART OF THE DISTRIBUTION BIAS.

function [Bias_Coefficient] = chebyshev_distribution_bias(num_in)
%% DISTRIBUTION OF PRIMES VIA CHEBYSHEV MODEL

if (num_in) == 1
    Bias_Coefficient = 1;
elseif (num_in) == 3
    Bias_Coefficient = 3;
elseif (num_in) == 7
    Bias_Coefficient = 7;
elseif (num_in) == 9
    Bias_Coefficient = 9;   
end
