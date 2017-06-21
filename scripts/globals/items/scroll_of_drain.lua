-----------------------------------------
--    ID: 4853
--    Scroll of Drain
--    Teaches the black magic Drain
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(245);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(245);
end;