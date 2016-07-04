-----------------------------------------
--    ID: 5005
--    Scroll of Valor Minuet IV
--    Teaches the song Valor Minuet IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(397);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(397);
end;