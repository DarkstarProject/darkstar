-----------------------------------------
--    ID: 6050
--    Rainstorm Schema
--    Teaches the white magic Rainstorm
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(113);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(113);
end;