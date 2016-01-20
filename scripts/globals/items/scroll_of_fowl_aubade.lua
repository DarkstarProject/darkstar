-----------------------------------------
--    ID: 5013
--    Scroll of Fowl Aubade
--    Teaches the song Fowl Aubade
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(405);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(405);
end;