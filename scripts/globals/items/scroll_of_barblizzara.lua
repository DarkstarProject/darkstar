-----------------------------------------
--    ID: 4675
--    Scroll of Barblizzara
--    Teaches the white magic Barblizzara
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(67);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(67);
end;