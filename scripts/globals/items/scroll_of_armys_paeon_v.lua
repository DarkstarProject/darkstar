-----------------------------------------
--    ID: 4990
--    Scroll of Armys Paeton V
--    Teaches the song Armys Paeton V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(382);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(382);
end;