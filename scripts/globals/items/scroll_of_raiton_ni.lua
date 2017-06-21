-----------------------------------------
--    ID: 4941
--    Scroll of Raiton: Ni
--    Teaches the ninjutsu Raiton: Ni
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(333);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(333);
end;