-----------------------------------------
--    ID: 4860
--    Scroll of Stun
--    Teaches the black magic Stun
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(252);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(252);
end;