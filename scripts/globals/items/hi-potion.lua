-----------------------------------------
-- ID: 4116
-- Item: Hi-Potion
-- Item Effect: Restores 100 HP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
local mHP = target:getMaxHP();
local cHP = target:getHP();

if (mHP == cHP) then
    result = 56; -- Does not let player use item if their hp is full
end
    
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:messageBasic(24,0,target:addHP(100*ITEM_POWER));
end;