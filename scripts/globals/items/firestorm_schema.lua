-----------------------------------------
--    ID: 6049
--    Firestorm Schema
--    Teaches the white magic Firestorm
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(115);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(115);
end;