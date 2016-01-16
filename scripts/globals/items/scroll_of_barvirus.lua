-----------------------------------------
--    ID: 4686
--    Scroll of Barvirus
--    Teaches the white magic Barvirus
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(78);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(78);
end;