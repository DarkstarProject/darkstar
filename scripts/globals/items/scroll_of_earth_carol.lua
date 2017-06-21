-----------------------------------------
--    ID: 5049
--    Scroll of Earth Carol
--    Teaches the song Earth Carol
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(441);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(441);
end;