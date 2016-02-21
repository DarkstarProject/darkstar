-----------------------------------------
--    ID: 4647
--    Scroll of Banishga II
--    Teaches the white magic Banishga II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(39);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(39);
end;