-----------------------------------------
--    ID: 4753
--    Scroll of Fire II
--    Teaches the black magic Fire II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(145);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(145);
end;