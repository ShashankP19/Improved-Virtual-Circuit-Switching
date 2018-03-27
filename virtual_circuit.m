WSD = 0.41; % Wait for Service Delay
DD = 0.43;  % Dispatcher Delay
FTD = 0.45;  % Fabric Transfer Delay
OD = 0.42;  % Output Delay
TLD = []; 

SHD = [];    % Switch Handle Delay
delSHD = [];  % Delay Jitter

time_step = [];

for i = 1: 100
    time_step(i) = i;
    TLD(i) = exprnd(1/0.45);    %  Table Lookup Delay
    SHD(i) = TLD(i) + WSD + DD + FTD + OD;
    if i == 1
        delSHD(i) = 0;
    else
        delSHD(i) = SHD(i) - SHD(i-1);
    end    
end

plot(time_step, delSHD);
