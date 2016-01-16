-----------------------------------------
--    ID: 4947
--    Scroll of Utsusemi: Ni
--    Teaches the ninjutsu Utsusemi: Ni
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(339);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(339);
end;