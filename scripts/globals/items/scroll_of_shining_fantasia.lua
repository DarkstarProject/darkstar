-----------------------------------------
--    ID: 5016
--    Scroll of Shining Fantasia
--    Teaches the song Shining Fantasia
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(408);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(408);
end;