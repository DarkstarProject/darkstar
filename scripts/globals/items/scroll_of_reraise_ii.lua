-----------------------------------------
--    ID: 4749
--    Scroll of Reraise II
--    Teaches the white magic Reraise II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(141);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(141);
end;