-----------------------------------------
--    ID: 4606
--    Scroll of Dia
--    Teaches the white magic Dia
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(23);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(23);
end;