-----------------------------------------
-- ID: 4141
-- Item: Pro-Ether +1
-- Item Effect: Restores 280 MP
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
local mMP = target:getMaxMP();
local cMP = target:getMP();

if (mMP == cMP) then
    result = 56; -- Does not let player use item if their hp is full

elseif (target:hasStatusEffect(EFFECT_MEDICINE)) then
    result = 111;
end
    
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:messageBasic(25,0,target:addMP(280*ITEM_POWER));
    target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
    
end;