-----------------------------------------
--    ID: 4702
--    Scroll of Sacrifice
--    Teaches the white magic Sacrifice
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(94);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(94);
end;