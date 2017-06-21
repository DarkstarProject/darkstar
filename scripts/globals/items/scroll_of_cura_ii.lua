-----------------------------------------
--    ID: 5082
--    Scroll of Cura II
--    Teaches the white magic Cura II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(474);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(474);
end;