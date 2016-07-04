-----------------------------------------
--    ID: 4676
--    Scroll of Baraera
--    Teaches the white magic Baraera
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(68);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(68);
end;