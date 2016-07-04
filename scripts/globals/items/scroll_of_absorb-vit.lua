-----------------------------------------
--    ID: 4876
--    Scroll of Absorb-VIT
--    Teaches the black magic Absorb-VIT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(268);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(268);
end;