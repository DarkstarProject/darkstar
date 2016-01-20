-----------------------------------------
--    ID: 4971
--    Scroll of Yain: Ichi
--    Teaches the ninjutsu Yain: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(506);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(506);
end;