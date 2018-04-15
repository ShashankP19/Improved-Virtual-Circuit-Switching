% Function to find the Table Lookup Delay(TLD)

function TLD = getTLD(a)
    %TLD = 0.01*exprnd(1/a);
    a = 0.053;
    b = 0.06;
    TLD = (b-a)*rand() + a;
    
end

