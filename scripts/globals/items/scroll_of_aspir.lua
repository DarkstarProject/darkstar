-----------------------------------------
--    ID: 4855
--    Scroll of Aspir
--    Teaches the black magic Aspir
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(247);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(247);
end;