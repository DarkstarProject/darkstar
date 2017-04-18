-----------------------------------------
-- ID: 4915
-- Scroll of Frazzle II
-- Teaches the black magic Frazzle II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(844);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(844);
end;
