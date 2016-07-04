-----------------------------------------
--    ID: 5040
--    Scroll of Uncanny Etude
--    Teaches the song Uncanny Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(432);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(432);
end;