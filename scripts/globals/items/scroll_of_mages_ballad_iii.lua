-----------------------------------------
--    ID: 4996
--    Scroll of Mages Ballad III
--    Teaches the song Mages Ballad III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(388);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(388);
end;