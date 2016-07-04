-----------------------------------------
-- ID: 5254
-- Item: Hyper-Potion
-- Item Effect: Restores 250 hP
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
    
elseif (target:hasStatusEffect(EFFECT_MEDICINE) == true) then
    result = 111;
end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:messageBasic(24,0,target:addHP(250*ITEM_POWER));
    target:addStatusEffect(EFFECT_MEDICINE,0,0,300);
end;
