-----------------------------------------
--    ID: 4690
--    Scroll of Baramnesia
--    Teaches the white magic Baramnesia
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(84);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(84);
end;