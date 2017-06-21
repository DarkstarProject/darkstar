-----------------------------------------
--    ID: 4711
--    Scroll of Enstone
--    Teaches the white magic Enstone
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(103);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(103);
end;