-----------------------------------------
--    ID: 4833
--    Scroll of Poisonga
--    Teaches the black magic Poisonga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(225);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(225);
end;