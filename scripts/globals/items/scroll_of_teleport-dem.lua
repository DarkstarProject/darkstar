-----------------------------------------
--    ID: 4731
--    Scroll of Teleport-Dem
--    Teaches the white magic Teleport-Dem
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(123);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(123);
end;