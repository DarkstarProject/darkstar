-----------------------------------------
--    ID: 4787
--    Scroll of Blizzaga
--    Teaches the black magic Blizzaga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(179);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(179);
end;