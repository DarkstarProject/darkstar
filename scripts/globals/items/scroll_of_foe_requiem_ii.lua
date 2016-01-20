-----------------------------------------
--    ID: 4977
--    Scroll of Foe Requiem II
--    Teaches the song Foe Requiem II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(369);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(369);
end;