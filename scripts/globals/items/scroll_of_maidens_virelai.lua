-----------------------------------------
--    ID: 5074
--    Scroll of Maiden's Virelai
--    Teaches the song Maiden's Virelai
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(466);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(466);
end;