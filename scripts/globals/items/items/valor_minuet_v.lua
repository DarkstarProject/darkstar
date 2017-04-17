-----------------------------------------
-- ID: 5006
-- Scroll of valor minuet v
-- Teaches the black magic valor minuet v
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(398);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(398);
end;
