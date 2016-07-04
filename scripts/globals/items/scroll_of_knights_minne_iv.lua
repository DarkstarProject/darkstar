-----------------------------------------
--    ID: 5000
--    Scroll of Knights Minne IV
--    Teaches the song Mages Ballad IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(392);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(392);
end;