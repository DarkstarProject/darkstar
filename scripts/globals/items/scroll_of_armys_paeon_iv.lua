-----------------------------------------
--    ID: 4989
--    Scroll of Armys Paeton IV
--    Teaches the song Armys Paeton IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(381);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(381);
end;