-----------------------------------------
--    ID: 5090
--    Scroll of Gain-AGI
--    Teaches the white magic Gain-AGI
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(489);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(489);
end;