-----------------------------------------
--    ID: 5011
--    Scroll of Sheepfoe Mambo
--    Teaches the song Sheepfoe Mambo
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(403);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(403);
end;