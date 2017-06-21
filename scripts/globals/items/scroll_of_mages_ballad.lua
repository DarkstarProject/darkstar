-----------------------------------------
--    ID: 4994
--    Scroll of Mages Ballad
--    Teaches the song Mages Ballad
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(386);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(386);
end;