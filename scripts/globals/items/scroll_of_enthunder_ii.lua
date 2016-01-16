-----------------------------------------
--    ID: 4726
--    Scroll of Enthunder II
--    Teaches the white magic Enthunder II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(316);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(316);
end;