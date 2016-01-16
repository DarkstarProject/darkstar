-----------------------------------------
--    ID: 5034
--    Scroll of Vivacious Etude
--    Teaches the song Vivacious Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(426);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(426);
end;