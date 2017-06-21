-----------------------------------------
--    ID: 4781
--    Scroll of Water V
--    Teaches the black magic Water V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(173);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(173);
end;