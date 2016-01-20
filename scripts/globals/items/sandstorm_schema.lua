-----------------------------------------
--    ID: 6053
--    Sandstorm Schema
--    Teaches the white magic Sandstorm
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(99);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(99);
end;