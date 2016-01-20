-----------------------------------------
--    ID: 5006
--    Scroll of Valor Minuet V
--    Teaches the song Valor Minuet V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(398);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(398);
end;