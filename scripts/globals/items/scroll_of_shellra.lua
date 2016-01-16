-----------------------------------------
--    ID: 4738
--    Scroll of Shellra
--    Teaches the white magic Shellra
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(130);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(130);
end;