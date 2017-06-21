-----------------------------------------
--    ID: 6052
--    Hailstorm Schema
--    Teaches the white magic Hailstorm
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(116);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(116);
end;