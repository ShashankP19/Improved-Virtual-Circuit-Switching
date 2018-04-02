WSD = 0.41; % Wait for Service Delay
DD = 0.43;  % Dispatcher Delay
FTD = 0.45;  % Fabric Transfer Delay
OD = 0.42;  % Output Delay
TLD = []; 

SHD = [];    % Switch Handle Delay
delSHD = [];  % Delay Jitter

HFS_SHD = [];    % Half Step Forward Switch Handle Delay
delHFS_SHD = [];  %  Half Step Forward Delay Jitter
time_step = [];

for i = 1: 100
    time_step(i) = i;
    TLD(i) = exprnd(1/0.45);    %  Table Lookup Delay
    SHD(i) = TLD(i) + WSD + DD + FTD + OD;
    HFS_SHD(i) = WSD + DD + max(FTD, TLD(i)) + OD;
    if i == 1
        delSHD(i) = 0;
        delHFS_SHD(i) = 0;
    else
        delSHD(i) = SHD(i) - SHD(i-1);
        delHFS_SHD(i) = (abs(TLD(i)-FTD) + WSD + DD + OD) - (abs(TLD(i-1)-FTD) + WSD + DD + OD);
    end    
end


%plot(time_step, delSHD, time_step, delHFS_SHD);
plot(time_step, SHD, time_step, HFS_SHD);