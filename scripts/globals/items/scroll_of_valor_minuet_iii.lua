-----------------------------------------
--    ID: 5004
--    Scroll of Valor Minuet III
--    Teaches the song Valor Minuet III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(396);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(396);
end;