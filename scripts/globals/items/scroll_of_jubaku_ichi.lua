-----------------------------------------
--    ID: 4949
--    Scroll of Jubaku: Ichi
--    Teaches the ninjutsu Jubaku: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(341);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(341);
end;