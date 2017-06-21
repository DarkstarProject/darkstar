-----------------------------------------
--    ID: 4981
--    Scroll of Foe Requiem VI
--    Teaches the song Foe Requiem VI
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(373);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(373);
end;