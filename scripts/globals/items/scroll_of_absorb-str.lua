-----------------------------------------
--    ID: 4874
--    Scroll of Absorb-STR
--    Teaches the black magic Absorb-STR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(266);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(266);
end;