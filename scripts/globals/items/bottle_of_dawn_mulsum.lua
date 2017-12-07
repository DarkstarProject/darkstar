-----------------------------------------
-- ID: 5411
-- Item: bottle_of_dawn_mulsum
-- Item Effect: Instantly restores 20%-35% of pet HP
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/msg");

function onItemCheck(target)
    if (not target:hasPet()) then
        return msgBasic.REQUIRES_A_PET;
    end
    return 0;
end;

function onItemUse(target)
    local percent = math.random(20, 35) * ITEM_POWER;
    local pet = target:getPet();
    local totalHP = (pet:getMaxHP()/100)*percent;
    pet:addHP(totalHP);
    pet:messageBasic(msgBasic.RECOVERS_HP, 0, totalHP);
end;
