-----------------------------------------
--    ID: 4668
--    Scroll of Barfire
--    Teaches the white magic Barfire
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(60);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(60);
end;