-----------------------------------------
--    ID: 4955
--    Scroll of Kurayami: Ichi
--    Teaches the ninjutsu Kurayami: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(347);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(347);
end;