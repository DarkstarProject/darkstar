-----------------------------------------
--    ID: 4759
--    Scroll of Blizzard III
--    Teaches the black magic Blizzard III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(151);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(151);
end;