-----------------------------------------
--    ID: 4940
--    Scroll of Raiton: Ichi
--    Teaches the ninjutsu Raiton: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(332);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(332);
end;