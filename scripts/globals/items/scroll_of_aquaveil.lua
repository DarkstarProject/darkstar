-----------------------------------------
--    ID: 4663
--    Scroll of Aquaveil
--    Teaches the white magic Aquaveil
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(55);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(55);
end;