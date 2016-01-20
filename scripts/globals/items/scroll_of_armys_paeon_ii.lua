-----------------------------------------
--    ID: 4987
--    Scroll of Armys Paeton II
--    Teaches the song Armys Paeton II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(379);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(379);
end;