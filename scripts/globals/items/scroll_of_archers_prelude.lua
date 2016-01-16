-----------------------------------------
--    ID: 5010
--    Scroll of Archers Prelude
--    Teaches the song Archers Prelude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(402);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(402);
end;