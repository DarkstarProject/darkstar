-----------------------------------------
--    ID: 5045
--    Scroll of Bewitching Etude
--    Teaches the song Bewitching Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(437);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(437);
end;