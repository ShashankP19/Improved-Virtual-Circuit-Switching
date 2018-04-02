
TLD = [];   % Table Lookup Delay for each time step
WSD = [];   % Wait for Service Delay for each time step
DD = [];    % Dispatch Delay for each time step
FTD = [];   % Fabric Transfer Delay for each time step
OD = [];    % Output Delay for each time step


SHD = [];    % Switch Handle Delay for each time step
delSHD = [];  % Delay Jitter for each time step

HFS_SHD = [];    % Half Step Forward Switch Handle Delay for each time step
delHFS_SHD = [];  %  Half Step Forward Delay Jitter for each time step

time_step = []; % Time step

num_iter = 100; % Number of iterations

for i = 1: num_iter
    time_step(i) = i;
    TLD(i) = getTLD(1/0.45);    %  Table Lookup Delay
    WSD(i) = getWSD();          %  Wait for Service Delay
    DD(i) = getDD();            %  Dispatch Delay
    FTD(i) = getFTD();          %  Fabric Transfer Delay
    OD(i) = getOD();            %  Output Delay
    SHD(i) = calculateSHD(TLD(i), WSD(i), );
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