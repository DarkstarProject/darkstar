-----------------------------------------
--    ID: 5002
--    Scroll of Valor Minuet
--    Teaches the song Valor Minuet
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(394);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(394);
end;