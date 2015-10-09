
-----------------------------------------
-- ID: 4891
-- Scroll of blizzaja
-- Teaches the black magic blizzaja
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(497);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(497);
end;
