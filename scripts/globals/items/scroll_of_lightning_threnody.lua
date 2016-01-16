-----------------------------------------
--    ID: 5066
--    Scroll of Lightning Threnody
--    Teaches the song Lightning Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(458);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(458);
end;