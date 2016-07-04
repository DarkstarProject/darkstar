-----------------------------------------
--    ID: 5069
--    Scroll of Dark Threnody
--    Teaches the song Dark Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(461);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(461);
end;