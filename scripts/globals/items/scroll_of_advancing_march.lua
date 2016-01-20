-----------------------------------------
--    ID: 5027
--    Scroll of Advancing March
--    Teaches the song Advancing March
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(419);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(419);
end;