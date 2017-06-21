-----------------------------------------
--    ID: 4931
--    Scroll of Hyoton: Ni
--    Teaches the ninjutsu Hyoton: Ni
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(324);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(324);
end;