-----------------------------------------
--    ID: 5043
--    Scroll of Sage Etude
--    Teaches the song Sage Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(435);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(435);
end;