-----------------------------------------
--    ID: 5044
--    Scroll of Logical Etude
--    Teaches the song Logical Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(436);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(436);
end;