-----------------------------------------
--    ID: 5032
--    Scroll of Sinewy Etude
--    Teaches the song Sinewy Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(424);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(424);
end;