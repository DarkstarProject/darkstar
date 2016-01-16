-----------------------------------------
--    ID: 4704
--    Scroll of Auspice
--    Teaches the white magic Auspice
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(96);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(96);
end;