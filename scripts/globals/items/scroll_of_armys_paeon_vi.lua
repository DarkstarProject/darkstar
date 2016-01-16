-----------------------------------------
--    ID: 4991
--    Scroll of Armys Paeton VI
--    Teaches the song Armys Paeton VI
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(383);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(383);
end;