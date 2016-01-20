-----------------------------------------
--    ID: 4870
--    Scroll of Warp II
--    Teaches the black magic Warp II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(262);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(262);
end;