
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
    
    % Switch Handle Delay
    SHD(i) = calculateSHD(TLD(i), WSD(i), DD(i), FTD(i), OD(i));
    
    % Half Step Forwar Switch Handle Delay
    HFS_SHD(i) = calculateHFS_SHD(TLD(i), WSD(i), DD(i), FTD(i), OD(i));
    
    
    if i == 1
        delSHD(i) = 0;
        delHFS_SHD(i) = 0;
    else
        % Delay Jitter
        delSHD(i) = calculateDelSHD([SHD(i-1), SHD(i)]);
        
        % Half Step Forward Delay Jitter
        delHFS_SHD(i) = calculateDelHFS_SHD([TLD(i-1),TLD(i)], [WSD(i-1),WSD(i)], [DD(i-1),DD(i)], [FTD(i-1),FTD(i)], [OD(i-1),OD(i)]);
    end    
end

% Plot Switch Handle Delays 
shd_plot = plot(time_step, SHD, 'b', time_step, HFS_SHD, 'g')
legend('switching process delay of traditional switching technology', 'switching process delay of HSF switching technology')
title(['Switch Handle Delay'])
xlabel('Time')
ylabel('Switch Handle Delay')
saveas(gcf,'SHD.png')

% Plot Delay Jitters
C = [delSHD;delHFS_SHD];
C = C.';
dj_plot = area(time_step, C)
set(dj_plot(1), 'FaceColor', 'g')
set(dj_plot(2), 'FaceColor','b')
legend('delay jitter of HSF switching technology', 'delay jitter of traditional switching technology')
title(['Delay Jitter'])
xlabel('Time')
ylabel('Delay jitter')
saveas(gcf,'DelayJitter.png')