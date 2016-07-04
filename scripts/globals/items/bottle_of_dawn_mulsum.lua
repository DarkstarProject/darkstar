-----------------------------------------
-- ID: 5411
-- Item: bottle_of_dawn_mulsum
-- Item Effect: Instantly restores 20%-35% of pet HP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;

if (target:hasPet() == false) then
    -- result = 56;
    result = 215; -- this right?
end

return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local percent = math.random(20, 35) * ITEM_POWER;
    local pet = target:getPet();

    local totalHP = (pet:getMaxHP()/100)*percent;

    pet:addHP(totalHP);

    pet:messageBasic(24,0, totalHP);
end;