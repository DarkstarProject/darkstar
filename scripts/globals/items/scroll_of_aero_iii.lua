-----------------------------------------
--    ID: 4764
--    Scroll of Aero III
--    Teaches the black magic Aero III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(156);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(156);
end;