-----------------------------------------
--    ID: 5050
--    Scroll of Lightning Carol
--    Teaches the song Lightning Carol
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(442);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(442);
end;