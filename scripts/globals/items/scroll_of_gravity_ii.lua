-----------------------------------------
-- ID: 4825
-- Scroll of Gravity II
-- Teaches the black magic Gravity II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(217);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(217);
end;
