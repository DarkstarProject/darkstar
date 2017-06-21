-----------------------------------------
--    ID: 5099
--    Scroll of Boost-MND
--    Teaches the white magic Boost-MND
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(484);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(484);
end;