-----------------------------------------
--    ID: 5075
--    Scroll of Raptor Mazurka
--    Teaches the song Raptor Mazurka
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(467);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(467);
end;