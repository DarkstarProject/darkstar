-----------------------------------------
--    ID: 6051
--    Thunderstorm Schema
--    Teaches the white magic Thunderstorm
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(117);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(117);
end;