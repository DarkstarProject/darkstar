-----------------------------------------
--    ID: 4820
--    Scroll of Burst
--    Teaches the black magic Burst
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(212);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(212);
end;