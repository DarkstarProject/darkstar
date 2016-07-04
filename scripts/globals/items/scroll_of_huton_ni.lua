-----------------------------------------
--    ID: 4935
--    Scroll of Huton: Ni
--    Teaches the ninjutsu Huton: Ni
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(327);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(327);
end;