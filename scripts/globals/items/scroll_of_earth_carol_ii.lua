-----------------------------------------
--    ID: 5057
--    Scroll of Earth Carol II
--    Teaches the song Earth Carol II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(449);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(449);
end;