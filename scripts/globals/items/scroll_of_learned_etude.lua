-----------------------------------------
--    ID: 5036
--    Scroll of Learned Etude
--    Teaches the song Learned Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(428);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(428);
end;