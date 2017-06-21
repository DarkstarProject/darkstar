-----------------------------------------
--    ID: 4669
--    Scroll of Barblizzard
--    Teaches the white magic Barblizzard
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(61);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(61);
end;