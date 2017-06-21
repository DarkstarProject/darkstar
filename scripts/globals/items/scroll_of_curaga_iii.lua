-----------------------------------------
--    ID: 4617
--    Scroll of Curaga III
--    Teaches the white magic Curaga III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(9);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(9);
end;