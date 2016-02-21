-----------------------------------------
--    ID: 5009
--    Scroll of Hunters Prelude
--    Teaches the song Hunters Prelude
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(401);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(401);
end;