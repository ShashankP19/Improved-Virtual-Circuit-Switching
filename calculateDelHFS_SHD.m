% Function to calculate Delay Jitter of Half Step Forward Switching
% Technology (HSFST)

function delHFS_SHD = calculateDelHFS_SHD(TLD, WSD, DD, FTD, OD)
    delHFS_SHD = (abs(TLD(1)-FTD(1)) + WSD(1)_ + DD(1) + OD(1)) - (abs(TLD(0)-FTD(0)) + WSD(0) + DD(0) + OD(0));
end