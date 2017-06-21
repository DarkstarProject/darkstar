-----------------------------------------
--    ID: 4752
--    Scroll of Fire
--    Teaches the black magic Fire
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(144);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(144);
end;