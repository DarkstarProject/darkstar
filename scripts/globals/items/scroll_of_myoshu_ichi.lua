-----------------------------------------
--    ID: 4966
--    Scroll of Myoshu: Ichi
--    Teaches the ninjutsu Myoshu: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(507);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(507);
end;