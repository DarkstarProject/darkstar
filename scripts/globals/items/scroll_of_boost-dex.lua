-----------------------------------------
--    ID: 5095
--    Scroll of Boost-DEX
--    Teaches the white magic Boost-DEX
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(480);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(480);
end;