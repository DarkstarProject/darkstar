-----------------------------------------
--    ID: 4999
--    Scroll of Knights Minne III
--    Teaches the song Mages Ballad III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(391);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(391);
end;