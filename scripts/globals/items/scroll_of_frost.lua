-----------------------------------------
--    ID: 4844
--    Scroll of Frost
--    Teaches the black magic Frost
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(236);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(236);
end;