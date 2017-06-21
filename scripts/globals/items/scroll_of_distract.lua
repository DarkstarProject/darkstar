-----------------------------------------
--    ID: 4912
--    Scroll of Distract
--    Teaches the black magic Distract
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(841);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(841);
end;
