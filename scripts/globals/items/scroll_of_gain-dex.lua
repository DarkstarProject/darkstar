-----------------------------------------
--    ID: 5088
--    Scroll of Gain-DEX
--    Teaches the white magic Gain-DEX
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(487);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(487);
end;