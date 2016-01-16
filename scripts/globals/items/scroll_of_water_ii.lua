-----------------------------------------
--    ID: 4778
--    Scroll of Water II
--    Teaches the black magic Water II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(170);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(170);
end;