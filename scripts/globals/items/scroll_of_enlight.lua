-----------------------------------------
--    ID: 4706
--    Scroll of Enlight
--    Teaches the white magic Enlight
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(310);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(310);
end;