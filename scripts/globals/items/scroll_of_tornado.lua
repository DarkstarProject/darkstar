-----------------------------------------
--    ID: 4816
--    Scroll of Tornado
--    Teaches the black magic Tornado
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(208);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(208);
end;