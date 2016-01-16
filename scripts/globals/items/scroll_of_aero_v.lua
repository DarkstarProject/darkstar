-----------------------------------------
--    ID: 4766
--    Scroll of Aero V
--    Teaches the black magic Aero V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(158);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(158);
end;