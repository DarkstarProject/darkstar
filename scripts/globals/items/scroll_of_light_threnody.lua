-----------------------------------------
--    ID: 5068
--    Scroll of Light Threnody
--    Teaches the song Light Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(460);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(460);
end;