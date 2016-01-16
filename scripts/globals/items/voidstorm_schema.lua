-----------------------------------------
--    ID: 6056
--    Voidstorm Schema
--    Teaches the white magic Voidstorm
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(118);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(118);
end;