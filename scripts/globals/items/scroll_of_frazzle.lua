-----------------------------------------
-- ID: 4914
-- Scroll of Frazzle
-- Teaches the black magic Frazzle
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(843);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(843);
end;
