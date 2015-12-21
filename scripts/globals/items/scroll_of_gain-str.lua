-----------------------------------------
--    ID: 5087
--    Scroll of Gain-STR
--    Teaches the white magic Gain-STR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(486);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(486);
end;