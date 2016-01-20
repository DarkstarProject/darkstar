-----------------------------------------
--    ID: 4662
--    Scroll of Stoneskin
--    Teaches the white magic Stoneskin
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(54);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(54);
end;