-----------------------------------------
--    ID: 4877
--    Scroll of Absorb-AGI
--    Teaches the black magic Absorb-AGI
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(269);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(269);
end;