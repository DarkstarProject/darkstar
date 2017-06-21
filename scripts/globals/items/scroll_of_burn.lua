-----------------------------------------
--    ID: 4843
--    Scroll of Burn
--    Teaches the black magic Burn
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(235);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(235);
end;