-----------------------------------------
--    ID: 4747
--    Scroll of Teleport-Vahzl
--    Teaches the white magic Teleport-Vahzl
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(139);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(139);
end;