-----------------------------------------
--    ID: 4691
--    Scroll of Baramnesra
--    Teaches the white magic Baramnesra
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(85);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(85);
end;