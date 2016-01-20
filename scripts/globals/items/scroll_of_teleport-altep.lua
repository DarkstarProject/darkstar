-----------------------------------------
--    ID: 4729
--    Scroll of Teleport-Altep
--    Teaches the white magic Teleport-Altep
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(121);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(121);
end;