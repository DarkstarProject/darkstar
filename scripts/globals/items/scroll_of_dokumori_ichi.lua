-----------------------------------------
--    ID: 4958
--    Scroll of Dokumori: Ichi
--    Teaches the ninjutsu Dokumori: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(350);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(350);
end;