% Function to calculate Delay Jitter of Half Step Forward Switching
% Technology (HSFST)

function delHFS_SHD = calculateDelHFS_SHD(TLD, WSD, DD, FTD, OD)
    delHFS_SHD = (abs(TLD(2)-FTD(2)) + WSD(2) + DD(2) + OD(2)) - (abs(TLD(1)-FTD(1)) + WSD(1) + DD(1) + OD(1));
end