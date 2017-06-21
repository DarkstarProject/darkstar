-----------------------------------------
--    ID: 4929
--    Scroll of Katon: Ni
--    Teaches the ninjutsu Katon: Ni
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(321);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(321);
end;