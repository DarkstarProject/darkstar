-----------------------------------------
-- ID: 5105
-- Scroll of Flurry II
-- Teaches the white magic Flurry II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(846);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(846);
end;