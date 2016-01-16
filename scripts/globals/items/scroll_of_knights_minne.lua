-----------------------------------------
--    ID: 4997
--    Scroll of Knights Minne
--    Teaches the song Mages Ballad
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(389);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(389);
end;