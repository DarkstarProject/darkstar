-----------------------------------------
--    ID: 4809
--    Scroll of Waterga III
--    Teaches the black magic Waterga III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(201);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(201);
end;