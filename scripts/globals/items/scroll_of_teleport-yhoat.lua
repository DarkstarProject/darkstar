-----------------------------------------
--    ID: 4728
--    Scroll of Teleport-Yhoat
--    Teaches the white magic Teleport-Yhoat
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(120);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(120);
end;