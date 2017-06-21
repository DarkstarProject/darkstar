-----------------------------------------
--    ID: 4683
--    Scroll of Barblind
--    Teaches the white magic Barblind
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(75);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(75);
end;