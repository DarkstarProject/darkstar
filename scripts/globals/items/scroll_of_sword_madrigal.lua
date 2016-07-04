-----------------------------------------
--    ID: 5007
--    Scroll of Sword Madrigal
--    Teaches the song Sword Madrigal
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(399);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(399);
end;