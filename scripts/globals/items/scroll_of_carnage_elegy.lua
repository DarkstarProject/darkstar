-----------------------------------------
--    ID: 5030
--    Scroll of Carnage Elegy
--    Teaches the song Carnage Elegy
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(422);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(422);
end;