-----------------------------------------
--    ID: 4875
--    Scroll of Absorb-DEX
--    Teaches the black magic Absorb-DEX
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(267);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(267);
end;