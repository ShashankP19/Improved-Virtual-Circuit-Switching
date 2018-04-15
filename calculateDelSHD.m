% Function to calculate Delay Jitter of traditional virtual circuit
% switching technology

function delSHD = calculateDelSHD(SHD)
    delSHD = SHD(2)-SHD(1);
end