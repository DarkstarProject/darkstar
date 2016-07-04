-----------------------------------------
--    ID: 5477
--    Warrior Die
--    Teaches the job ability Fighter's Roll
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnAbility(93);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addLearnedAbility(93);
end;