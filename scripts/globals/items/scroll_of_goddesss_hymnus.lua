-----------------------------------------
--    ID: 5072
--    Scroll of Goddess's Hymnus
--    Teaches the song Goddess's Hymnus
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(464);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(464);
end;