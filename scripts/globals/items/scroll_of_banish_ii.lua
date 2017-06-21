-----------------------------------------
--    ID: 4637
--    Scroll of Banish II
--    Teaches the white magic Banish II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(29);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(29);
end;