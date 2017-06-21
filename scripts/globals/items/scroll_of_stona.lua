-----------------------------------------
--    ID: 4626
--    Scroll of Stona
--    Teaches the white magic Stona
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(18);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(18);
end;