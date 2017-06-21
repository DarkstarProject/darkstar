-----------------------------------------
--    ID: 5001
--    Scroll of Knights Minne V
--    Teaches the song Mages Ballad V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(393);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(393);
end;