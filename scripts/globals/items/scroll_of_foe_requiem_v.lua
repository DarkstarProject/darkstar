-----------------------------------------
--    ID: 4980
--    Scroll of Foe Requiem V
--    Teaches the song Foe Requiem V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(372);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(372);
end;