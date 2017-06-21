-----------------------------------------
--    ID: 5063
--    Scroll of Ice Threnody
--    Teaches the song Ice Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(455);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(455);
end;