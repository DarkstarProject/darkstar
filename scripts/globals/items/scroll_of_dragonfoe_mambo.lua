-----------------------------------------
--    ID: 5012
--    Scroll of Dragonfoe Mambo
--    Teaches the song Dragonfoe Mambo
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(404);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(404);
end;