-----------------------------------------
--    ID: 4988
--    Scroll of Armys Paeton III
--    Teaches the song Armys Paeton III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(380);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(380);
end;