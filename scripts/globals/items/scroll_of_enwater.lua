-----------------------------------------
--    ID: 4713
--    Scroll of Enwater
--    Teaches the white magic Enwater
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(105);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(105);
end;