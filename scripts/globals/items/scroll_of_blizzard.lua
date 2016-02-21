-----------------------------------------
--    ID: 4757
--    Scroll of Blizzard
--    Teaches the black magic Blizzard
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(149);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(149);
end;