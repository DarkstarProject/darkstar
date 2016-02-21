-----------------------------------------
--    ID: 5097
--    Scroll of Boost-AGI
--    Teaches the white magic Boost-AGI
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(482);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(482);
end;