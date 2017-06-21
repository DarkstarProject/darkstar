-----------------------------------------
--    ID: 5085
--    Scroll of Regen IV
--    Teaches the white magic Regen IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(477);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(477);
end;