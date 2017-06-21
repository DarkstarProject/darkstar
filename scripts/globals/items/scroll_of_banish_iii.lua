-----------------------------------------
--    ID: 4638
--    Scroll of Banish III
--    Teaches the white magic Banish III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(30);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(30);
end;