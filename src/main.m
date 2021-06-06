%% BIASES IN THE DISTRIBUTION OF CONSECUTIVE PRIMES
%  NAME                 : ponte-vecchio
%  DATE STARTED         : 26 MAY 2016
%  DATE COMPLETED       : 29 MAY 2016
%  DATE LAST MODIFIED   : 06 JUN 2021
 
function main()
%% FUNCTION INITIALISATION
clc
clear
 
%% CREATE DIALOG BOX
% SET BOUNDARIES FOR THE DIALOG
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'modal';
 
% CREATE HELP MESSAGE TO TELL THE USER WHAT THEY'RE ABOUT TO DO.
What_Am_I_Doing = helpdlg(['You''re about to simulate the ',...
    'Riemann Prime Function and Chebyshev Prime Counting Function. ',...
    'The minimum and maximum values you enter enable you ',...
    'to set boundaries to the simulation of both functions. ',...
    'Larger values will take longer time ',...
    'but may show a more variety of biases in the distribution of ',...
    'consecutive primes. Smaller values will display a higher bias ',...
    'towards some consecutives accordingly.']);
uiwait(What_Am_I_Doing)
 
% SET DEFAULT VALUES AND UI TEXT
dialog_prompt = {'Minimum value (\geq 7)','Maximum value'};
dialog_name = 'Set Range';
dialog_default_answer = {'7','10000'};
 
% CREATE DIALOG BOX
Dialog = inputdlg(dialog_prompt,dialog_name,1,dialog_default_answer,CreateStruct);
tic 
%% CRITICAL VARIABLE INITIALISATION USING USER-GIVEN VALUES
% TRANSFER USER INPUT VALUES INTO CRITICAL VARIABLES
Minimum_Range = str2double(Dialog{1});
Maximum_Range = str2double(Dialog{2});
Maximum_Value = str2double(Dialog{2});
 
% THIS ENSURES CONSISTANT GRAPHING ORDER REGARDLESS OF SIZE OF RANGE
Range_Steps_Hist = round((Minimum_Range + Maximum_Range)/500);
Range_Steps_Bar = round((Minimum_Range + Maximum_Range)/1000);
 
%% PRIMALITY CHECK & GRAPHING THE CHEBYSHEV MODEL
% CREATE A VARIABLE FOR COUNTING LOOPS
Prime_Test_Subject = Minimum_Range;
 
% CREATE DIMENSIONS FOR EACH ARRAY INPUT
Parent_Array_Length = 1;
drawcount = 0;
Parent_Primes_Array = zeros(1,Parent_Array_Length);
BoxHandle = figure;
set(BoxHandle, 'Position', [0, 0, 1920, 1080]);
 
% PRIMALITY TEST & CHEBYSHEV PLOT LOOP
while Prime_Test_Subject <= Maximum_Range
    [answer] = isitprime(Prime_Test_Subject);
    
    % EXTRACT FINAL DIGITS AND ADD TO PARENT ARRAY
    if answer ~= 0
        if mod(drawcount,Range_Steps_Hist) ~= 0
            Parent_Primes_Array (Parent_Array_Length) = mod(Prime_Test_Subject,10);
            Parent_Array_Length = Parent_Array_Length + 1;
            drawcount = drawcount + 1;
            
        % PLOT CHEBYSHEV MODEL
        elseif mod(drawcount,Range_Steps_Hist) == 0
            
            Histo_bone = categorical(Parent_Primes_Array,[1,3,7,9],{'1','3','7','9'});
            subplot (1,2,1)
            histogram(Histo_bone,'BarWidth',0.5);
            xlabel (['\vartheta (',num2str(Maximum_Value),',m)'],'FontSize',12)
            ylabel ('\Sigma \vartheta (a,m)','Interpreter','tex','FontSize',12)
            title (['Chebyshev Prime Counting Function \vartheta (',num2str(Maximum_Value),',m)'],'FontSize',14)
            subplot (1,2,2)
            plot(1,Parent_Primes_Array)
            xlabel ('Please Wait Until The Graph Loads')
            drawnow
            
            drawcount = drawcount + 1;
        end
    end
    Prime_Test_Subject = Prime_Test_Subject +1;
end
 
%% INITIALISE VARIABLES FOR RIEMANN MODEL
Coefficient_Finder = 1;
Coefficient_Finder_Limit = 2;
drawcount = 0;
aa11 = 0;
aa33 = 0;
aa77 = 0;
aa99 = 0;
ab13 = 0;
ab17 = 0;
ab19 = 0;
ab31 = 0;
ab37 = 0;
ab39 = 0;
ab71 = 0;
ab73 = 0;
ab79 = 0;
ab91 = 0;
ab93 = 0;
ab97 = 0;
 
%% FIND AND ALLOCATE BIAS COEFFICIENTS
while Coefficient_Finder_Limit <= length(Parent_Primes_Array)
    
    % EVALUATE BIAS COEFFICIENTS AND DISTRIBUTE THEM
    if mod(drawcount,Range_Steps_Bar) ~= 0
        Bias_Coefficient = riemann_distribution_bias(Parent_Primes_Array(Coefficient_Finder),Parent_Primes_Array(Coefficient_Finder_Limit));
        
        [aa11,ab13,ab17,ab19,ab31,aa33,ab37,ab39,ab71,ab73,aa77,ab79,ab91,ab93,ab97,aa99]= riemann_coefficient_allocation(Bias_Coefficient,aa11,ab13,ab17,ab19,ab31,aa33,ab37,ab39,ab71,ab73,aa77,ab79,ab91,ab93,ab97,aa99);
        Coefficient_Finder = Coefficient_Finder + 1;
        Coefficient_Finder_Limit = Coefficient_Finder_Limit + 1;
        drawcount = drawcount + 1;
        
    % PLOT RIEMANN MODEL
    elseif mod(drawcount,Range_Steps_Bar) == 0
        Bargraph_Foundation = ...
            [aa11,NaN,ab13,NaN,NaN,NaN,ab17,NaN,ab19
            NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN
            ab31,NaN,aa33,NaN,NaN,NaN,ab37,NaN,ab39
            NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN
            NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN
            NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN
            ab71,NaN,ab73,NaN,NaN,NaN,aa77,NaN,ab79
            NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN
            ab91,NaN,ab93,NaN,NaN,NaN,ab97,NaN,aa99];
        
        subplot(1,2,2)
        Riemann_Distribution_Bias = bar3(Bargraph_Foundation);
        xlabel ('\pi (b) Prime ending b','FontSize',12)
        ylabel ('\pi (a), Prime ending a','FontSize',12)
        zlabel ('\pi (a,b)','FontSize',12)
        title ('Riemann Prime Function \pi (a,b)','FontSize',14)
        colorbar
        for Colour_Constant = 1:length(Riemann_Distribution_Bias)
            zdata = Riemann_Distribution_Bias(Colour_Constant).ZData;
            Riemann_Distribution_Bias(Colour_Constant).CData = zdata;
            Riemann_Distribution_Bias(Colour_Constant).FaceColor = 'interp';
        end
        
        drawnow
        Coefficient_Finder = Coefficient_Finder + 1;
        Coefficient_Finder_Limit = Coefficient_Finder_Limit + 1;
        drawcount = drawcount + 1;
    end
end
 
 
%% CALCULATE STATISTICS - RIEMANN
%  DEFINE VARIABLES
Riemann_Sigma = ab19 + ab17 + ab13 + aa11 + ab39 + ab37 + aa33 + ab31 + ab79 + aa77 + ab73 + ab71 + aa99 + ab97 + ab93 + ab91;
 
%  PERCENTAGES
percent_11 = aa11./Riemann_Sigma * 100;
percent_13 = ab13./Riemann_Sigma * 100;
percent_17 = ab17./Riemann_Sigma * 100;
percent_19 = ab19./Riemann_Sigma * 100;
percent_31 = ab31./Riemann_Sigma * 100;
percent_33 = aa33./Riemann_Sigma * 100;
percent_37 = ab37./Riemann_Sigma * 100;
percent_39 = ab39./Riemann_Sigma * 100;
percent_71 = ab71./Riemann_Sigma * 100;
percent_73 = ab73./Riemann_Sigma * 100;
percent_77 = aa77./Riemann_Sigma * 100;
percent_79 = ab79./Riemann_Sigma * 100;
percent_91 = ab91./Riemann_Sigma * 100;
percent_93 = ab93./Riemann_Sigma * 100;
percent_97 = ab97./Riemann_Sigma * 100;
percent_99 = aa99./Riemann_Sigma * 100;

%  SET UP STATISTICS TO DISPLAY
stat_all = ['\Sigma \pi(a, b) = ',num2str(Riemann_Sigma)];
stat_aa11 = ['\Sigma \pi(1, 1) = ',num2str(aa11),'; ',num2str(percent_11),'%'];
stat_ab13 = ['\Sigma \pi(1, 3) = ',num2str(ab13),'; ',num2str(percent_13),'%'];
stat_ab17 = ['\Sigma \pi(1, 7) = ',num2str(ab17),'; ',num2str(percent_17),'%'];
stat_ab19 = ['\Sigma \pi(1, 9) = ',num2str(ab19),'; ',num2str(percent_19),'%'];
stat_ab31 = ['\Sigma \pi(3, 1) = ',num2str(ab31),'; ',num2str(percent_31),'%'];
stat_aa33 = ['\Sigma \pi(3, 3) = ',num2str(aa33),'; ',num2str(percent_33),'%'];
stat_ab37 = ['\Sigma \pi(3, 7) = ',num2str(ab37),'; ',num2str(percent_37),'%'];
stat_ab39 = ['\Sigma \pi(3, 9) = ',num2str(ab39),'; ',num2str(percent_39),'%'];
stat_ab71 = ['\Sigma \pi(7, 1) = ',num2str(ab71),'; ',num2str(percent_71),'%'];
stat_ab73 = ['\Sigma \pi(7, 3) = ',num2str(ab73),'; ',num2str(percent_73),'%'];
stat_aa77 = ['\Sigma \pi(7, 7) = ',num2str(aa77),'; ',num2str(percent_77),'%'];
stat_ab79 = ['\Sigma \pi(7, 9) = ',num2str(ab79),'; ',num2str(percent_79),'%'];
stat_ab91 = ['\Sigma \pi(9, 1) = ',num2str(ab91),'; ',num2str(percent_91),'%'];
stat_ab93 = ['\Sigma \pi(9, 3) = ',num2str(ab93),'; ',num2str(percent_93),'%'];
stat_ab97 = ['\Sigma \pi(9, 7) = ',num2str(ab97),'; ',num2str(percent_97),'%'];
stat_aa99 = ['\Sigma \pi(9, 9) = ',num2str(aa99),'; ',num2str(percent_99),'%'];
 
%% CALCULATE STATISTICS - CHEBYSHEV
% DEFINE VARIABLES
one = 0;
three = 0;
seven = 0;
nine = 0;
Coefficient_Finder_Limit = 1;
 
% CALCULATION
while Coefficient_Finder_Limit <= length(Parent_Primes_Array)
    Bias_Coefficient = chebyshev_distribution_bias(Parent_Primes_Array(Coefficient_Finder_Limit));
    [one,three,seven,nine] = chebyshev_coefficient_allocation(Bias_Coefficient,one, three, seven, nine);
    Coefficient_Finder_Limit = Coefficient_Finder_Limit + 1;
end
Chebyshev_Sigma = one + three + seven + nine;
 
% PERCENTAGES
percent_1 = one ./ Chebyshev_Sigma * 100;
percent_3 = three ./ Chebyshev_Sigma * 100;
percent_7 = seven ./ Chebyshev_Sigma * 100;
percent_9 = nine ./ Chebyshev_Sigma * 100;
 
% DISPLAY STATISTICS
stat_sum = ['\Sigma \vartheta (a,m) = ', num2str(Chebyshev_Sigma)];
stat_1 = ['\Sigma \vartheta (a,1) = ', num2str(one), ', Distribution of 1: ', num2str(percent_1),'%'];
stat_3 = ['\Sigma \vartheta (a,3) = ', num2str(three), ', Distribution of 3: ', num2str(percent_3),'%'];
stat_7 = ['\Sigma \vartheta (a,7) = ', num2str(seven), ', Distribution of 7: ', num2str(percent_7),'%'];
stat_9 = ['\Sigma \vartheta (a,9) = ', num2str(nine), ', Distribution of 9: ', num2str(percent_9),'%'];
toc
%% DISPLAY MESSAGE BOX
% RIEMANN
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'modal';
MsgBox_Riemann = msgbox({stat_all,stat_aa11,stat_ab13,stat_ab17,stat_ab19,stat_ab31,stat_aa33,stat_ab37,stat_ab39,stat_ab71,stat_ab73,stat_aa77,stat_ab79,stat_ab91,stat_ab93,stat_ab97,stat_aa99},'Riemann Stats',CreateStruct);
uiwait(MsgBox_Riemann);
 
% CHEBYSHEV
MsgBox_Chebyshev = msgbox({stat_sum,stat_1,stat_3,stat_7,stat_9},'Chebyshev Stats',CreateStruct);
uiwait(MsgBox_Chebyshev);
end
