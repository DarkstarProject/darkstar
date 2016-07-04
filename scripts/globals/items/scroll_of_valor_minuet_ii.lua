-----------------------------------------
--    ID: 5003
--    Scroll of Valor Minuet II
--    Teaches the song Valor Minuet II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(395);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(395);
end;