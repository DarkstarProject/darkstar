-----------------------------------------
--    ID: 5073
--    Scroll of Chocobo Mazurka
--    Teaches the song Chocobo Mazurka
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(465);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(465);
end;