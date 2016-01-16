-----------------------------------------
--    ID: 4695
--    Scroll of Barpoisonra
--    Teaches the white magic Barpoisonra
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(87);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(87);
end;