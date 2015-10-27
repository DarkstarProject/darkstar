-----------------------------------------
-- ID: 4894
-- Scroll of Thundaj
-- Teaches the black magic Thundaj
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(500);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(500);
end;
