-----------------------------------------
--    ID: 4627
--    Scroll of Viruna
--    Teaches the white magic Viruna
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(19);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(19);
end;