% Function to calculate Delay Jitter of traditional virtual circuit
% switching technology

function delSHD = calculateDelSHD(SHD)
    delSHD = SHD(1)-SHD(0);
end