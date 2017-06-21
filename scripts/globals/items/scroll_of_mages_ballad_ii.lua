-----------------------------------------
--    ID: 4995
--    Scroll of Mages Ballad II
--    Teaches the song Mages Ballad II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(387);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(387);
end;