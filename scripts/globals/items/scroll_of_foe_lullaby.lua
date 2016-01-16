-----------------------------------------
--    ID: 5071
--    Scroll of Foe Lullaby
--    Teaches the song Foe Lullaby
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(463);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(463);
end;