% Function to calculate Switch Handle Delay of Half Step Forward Switching
% Technology (HSFST)

function HFS_SHD = calculateHFS_SHD(TLD, WSD, DD, FTD, OD)
    HFS_SHD = WSD + DD + max(TLD, FTD) + OD;
end