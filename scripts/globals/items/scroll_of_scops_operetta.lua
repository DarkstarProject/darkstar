-----------------------------------------
--    ID: 5017
--    Scroll of Scops Operetta
--    Teaches the song Scops Operetta
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(409);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(409);
end;