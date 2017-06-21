-----------------------------------------
--    ID: 4760
--    Scroll of Blizzard IV
--    Teaches the black magic Blizzard IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(152);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(152);
end;