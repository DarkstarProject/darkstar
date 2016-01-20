-----------------------------------------
--    ID: 5064
--    Scroll of Wind Threnody
--    Teaches the song Wind Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(456);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(456);
end;