-----------------------------------------
--    ID: 4847
--    Scroll of Shock
--    Teaches the black magic Shock
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(239);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(239);
end;