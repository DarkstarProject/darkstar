-----------------------------------------
--    ID: Unknown
--    Scroll of Addle
--    Teaches the magic Addle
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(286);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(286);
end;
