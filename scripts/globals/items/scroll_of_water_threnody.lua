-----------------------------------------
--    ID: 5067
--    Scroll of Water Threnody
--    Teaches the song Water Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(459);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(459);
end;