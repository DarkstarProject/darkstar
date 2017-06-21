-----------------------------------------
--    ID: 4788
--    Scroll of Blizzaga II
--    Teaches the black magic Blizzaga II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(180);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(180);
end;