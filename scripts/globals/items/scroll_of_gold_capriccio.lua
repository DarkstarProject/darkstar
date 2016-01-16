-----------------------------------------
--    ID: 5020
--    Scroll of Gold Capriccio
--    Teaches the song Gold Capriccio
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(412);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(412);
end;