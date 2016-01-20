-----------------------------------------
--    ID: 4730
--    Scroll of Teleport-Holla
--    Teaches the white magic Teleport-Holla
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(122);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(122);
end;