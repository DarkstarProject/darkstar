-----------------------------------------
--    ID: 5033
--    Scroll of Dextrous Etude
--    Teaches the song Dextrous Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(425);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(425);
end;