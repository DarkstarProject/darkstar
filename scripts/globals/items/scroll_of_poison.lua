-----------------------------------------
--    ID: 4828
--    Scroll of Poison
--    Teaches the black magic Poison
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(220);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(220);
end;