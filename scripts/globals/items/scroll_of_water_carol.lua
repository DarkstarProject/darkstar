-----------------------------------------
--    ID: 5051
--    Scroll of Water Carol
--    Teaches the song Water Carol
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(443);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(443);
end;