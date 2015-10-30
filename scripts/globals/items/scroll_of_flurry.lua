-----------------------------------------
-- ID: 5104
-- Scroll of Flurry
-- Teaches the white magic Flurry
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(845);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(845);
end;