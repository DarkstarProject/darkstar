-----------------------------------------
-- ID: 19006
-- Item: Tizona
-- Additional effect: MP Gain from damage dealt
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)

    local chance = 0;

    if ( player:getEquipID(SLOT_MAIN) == 18997 ) then -- Tizona 75
        chance = 10;
    elseif ( player:getEquipID(SLOT_MAIN) == 19075 ) then -- Tizona 80
        chance = 15;
    elseif ( player:getEquipID(SLOT_MAIN) == 19095 ) then -- Tizona 85
        chance = 20;
    elseif ( ( player:getEquipID(SLOT_MAIN) == 19627 ) or ( player:getEquipID(SLOT_MAIN) == 19725 ) ) then -- Tizona 90 or Tizona 95
        chance = 25;
    elseif ( ( player:getEquipID(SLOT_MAIN) == 19963 ) or ( player:getEquipID(SLOT_MAIN) == 20651 ) or ( player:getEquipID(SLOT_MAIN) == 20652 )
                or ( player:getEquipID(SLOT_MAIN) == 20688 ) or ( player:getEquipID(SLOT_MAIN) == 19834 ) ) then -- Tizona 99
        chance = 30;
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local drain = math.floor(damage * (math.random(100,200)/1000));
        player:addMP(drain);

        return SUBEFFECT_MP_DRAIN, msgBasic.ADD_EFFECT_MP_DRAIN, drain;
    end
end;