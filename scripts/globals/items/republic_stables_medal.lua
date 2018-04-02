-----------------------------------------
-- ID: 13180
-- Item: Republic Stables Medal
-- Teleports to Chocobo Stables (Bastok)
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:setPos(40.164,0.000,-83.578,64,234);  -- {R}
end;
