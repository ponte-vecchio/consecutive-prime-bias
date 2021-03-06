function [answer] = isitprime(input)
% THIS FUNCTION WILL DETERMINE WHETHER A USER-ENTERED NUMBER IS A PRIME
% NUMBER OR NOT. THE OUTPUT WILL READ '0' IF THE NUMBER IS COMPOSITE. THE
% OUTPUT WILL READ '1' IF THE NUMBER IS PRIME.

%% ARRAY OF NUMBERS FROM 2 TO arb
numset = 2:sqrt(input);

%% TEST FOR RETURNED ANSWERS IN NON-ZERO
answer = all(mod(input,numset));

% 1 RETURNED IF ALL NON-ZERO, HENCE PRIME
% 0 RETURNED IF NON-ZERO PRESENT, COMPOSITE
end

