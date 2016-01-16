-----------------------------------------
--    ID: 4679
--    Scroll of Barwatera
--    Teaches the white magic Barwatera
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(71);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(71);
end;