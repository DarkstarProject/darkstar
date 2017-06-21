-----------------------------------------
--    ID: 5091
--    Scroll of Gain-INT
--    Teaches the white magic Gain-INT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(490);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(490);
end;