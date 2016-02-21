-----------------------------------------
--    ID: 4779
--    Scroll of Water III
--    Teaches the black magic Water III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(171);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(171);
end;