-----------------------------------------
--    ID: 4725
--    Scroll of Enstone II
--    Teaches the white magic Enstone II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(315);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(315);
end;