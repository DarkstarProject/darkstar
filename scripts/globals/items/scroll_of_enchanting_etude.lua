-----------------------------------------
--    ID: 5038
--    Scroll of Enchanting Etude
--    Teaches the song Enchanting Etude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(430);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(430);
end;