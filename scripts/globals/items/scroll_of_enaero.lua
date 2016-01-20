-----------------------------------------
--    ID: 4710
--    Scroll of Enaero
--    Teaches the white magic Enaero
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(102);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(102);
end;