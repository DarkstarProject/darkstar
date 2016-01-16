-----------------------------------------
--    ID: 4608,4609
--    Scroll of Cure
--    Teaches the white magic Cure
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(1);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(1);
end;