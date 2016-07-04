-----------------------------------------
--    ID: 5065
--    Scroll of Earth Threnody
--    Teaches the song Earth Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(457);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(457);
end;