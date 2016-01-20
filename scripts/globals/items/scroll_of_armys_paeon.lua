-----------------------------------------
--    ID: 4986
--    Scroll of Armys Paeton
--    Teaches the song Armys Paeton
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(378);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(378);
end;