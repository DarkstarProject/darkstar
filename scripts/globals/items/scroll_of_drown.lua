-----------------------------------------
--    ID: 4848
--    Scroll of Drown
--    Teaches the black magic Drown
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(240);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(240);
end;