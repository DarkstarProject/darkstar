-----------------------------------------
-- ID: 19006
-- Item: Tizona
-- Additional effect: MP Gain from damage dealt
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_TIZONA";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_TIZONA";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Nirvana (75)
aftermathTable[19006] =
{
    {   -- Tier 1
        duration = 60,
        mods =
        {
            { id = MOD_ACC, power = function(tp) return math.floor(tp / 100); end }
        }
    },
    {   -- Tier 2
        duration = 90,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(tp / 100 - 10); end }
        }
    },
    {   -- Tier 3
        duration = 120,
        mods =
        {
            { id = MOD_OCC_ATT_TWICE, power = function(tp) return 40; end }
        }
    }
};

-- Nirvana (80)
aftermathTable[19075] =
{
    {   -- Tier 1
        duration = 90,
        mods =
        {
            { id = MOD_ACC, power = function(tp) return math.floor(3 * tp / 200); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(3 * tp / 200 - 15); end }
        }
    },
    {   -- Tier 3
        duration = 180,
        mods =
        {
            { id = MOD_OCC_ATT_TWICE, power = function(tp) return 60; end }
        }
    }
};
aftermathTable[19095] = aftermathTable[19075]; -- Nirvana (85)
aftermathTable[19627] = aftermathTable[19075]; -- Nirvana (90)

-- Nirvana (95)
aftermathTable[19725] =
{
    {   -- Tier 1
        duration = 90,
        mods =
        {
            { id = MOD_ACC, power = function(tp) return math.floor(tp / 50 + 10); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(tp / 50 - 10); end }
        }
    },
    {   -- Tier 3
        duration = 180,
        mods =
        {
            { id = MOD_MYTHIC_OCC_ATT_TWICE, power = function(tp) return 40; end },
            { id = MOD_MYTHIC_OCC_ATT_THRICE, power = function(tp) return 20; end }
        }
    }
};
aftermathTable[19834] = aftermathTable[19725]; -- Nirvana (99)
aftermathTable[19963] = aftermathTable[19725]; -- Nirvana (99/II)
aftermathTable[20651] = aftermathTable[19725]; -- Nirvana (119)
aftermathTable[20652] = aftermathTable[19725]; -- Nirvana (119/II)
aftermathTable[20688] = aftermathTable[19725]; -- Nirvana (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_EXPIACION) then -- Expiacion onry
        if (shouldApplyAftermath(user, tp)) then
            local itemId = user:getEquipID(SLOT_MAIN);
            if (aftermathTable[itemId]) then
                -- Apply the effect and add mods
                addMythicAftermathEffect(user, tp, aftermathTable[itemId]);
                -- Add a listener for when aftermath wears (to remove mods)
                user:addListener("EFFECT_LOSE", NAME_EFFECT_LOSE, aftermathLost);
            end
        end
    end
end

function aftermathLost(target, effect)
    if (effect:getType() == EFFECT_AFTERMATH) then
        local itemId = target:getEquipID(SLOT_MAIN);
        if (aftermathTable[itemId]) then
            -- Remove mods
            removeMythicAftermathEffect(target, effect, aftermathTable[itemId]);
            -- Remove the effect listener
            target:removeListener(NAME_EFFECT_LOSE);
        end
    end
end

function onItemCheck(player, param, caster)
    if (param == ITEMCHECK_EQUIP) then
        player:addListener("WEAPONSKILL_USE", NAME_WEAPONSKILL, onWeaponskill);
    elseif (param == ITEMCHECK_UNEQUIP) then
        -- Make sure we clean up the effect and mods
        if (player:hasStatusEffect(EFFECT_AFTERMATH)) then
            aftermathLost(player, player:getStatusEffect(EFFECT_AFTERMATH));
        end
        player:removeListener(NAME_WEAPONSKILL);
    end
    
    return 0;
end

function onAdditionalEffect(player,target,damage)

    local chance = 0;

    if ( player:getEquipID(SLOT_MAIN) == 19006 ) then -- Tizona 75
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