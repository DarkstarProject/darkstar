-----------------------------------------
--    ID: 4701
--    Scroll of Cura
--    Teaches the white magic Cura
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(93);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(93);
end;