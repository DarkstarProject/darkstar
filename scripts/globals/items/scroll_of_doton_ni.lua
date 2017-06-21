-----------------------------------------
--    ID: 4938
--    Scroll of Doton: ni
--    Teaches the ninjutsu Doton: ni
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(330);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(330);
end;