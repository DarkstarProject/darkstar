-----------------------------------------
--    ID: 4866
--    Scroll of Bind
--    Teaches the black magic Bind
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(258);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(258);
end;