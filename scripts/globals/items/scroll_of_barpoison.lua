-----------------------------------------
--    ID: 4681
--    Scroll of Barpoison
--    Teaches the white magic Barpoison
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(73);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(73);
end;