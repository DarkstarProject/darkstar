-----------------------------------------
--    ID: 4829
--    Scroll of Poison II
--    Teaches the black magic Poison II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(221);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(221);
end;