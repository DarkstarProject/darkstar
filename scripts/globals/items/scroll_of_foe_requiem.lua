-----------------------------------------
--    ID: 4976
--    Scroll of Foe Requiem
--    Teaches the song Foe Requiem
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(368);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(368);
end;