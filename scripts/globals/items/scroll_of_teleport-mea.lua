-----------------------------------------
--    ID: 4732
--    Scroll of Teleport-Mea
--    Teaches the white magic Teleport-Mea
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(124);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(124);
end;