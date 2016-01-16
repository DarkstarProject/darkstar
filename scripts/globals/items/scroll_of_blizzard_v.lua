-----------------------------------------
--    ID: 4761
--    Scroll of Blizzard V
--    Teaches the black magic Blizzard V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(153);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(153);
end;