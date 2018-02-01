-----------------------------------------
-- ID: 19000
-- Item: Carnwenhan
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_CARNWENHAN";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_CARNWENHAN";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Carnwenhan (75)
aftermathTable[19000] =
{
    {   -- Tier 1
        duration = 180,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(tp / 100); end }
        }
    },
    {   -- Tier 2
        duration = 90,
        mods =
        {
            { id = MOD_ACC, power = function(tp) return math.floor(tp / 100 - 10); end }
        }
    },
    {   -- Tier 3
        duration = 120,
        mods =
        {
            { id = MOD_MYTHIC_OCC_ATT_TWICE, power = function(tp) return 40; end }
        }
    }
};

-- Carnwenhan (80)
aftermathTable[19069] =
{
    {   -- Tier 1
        duration = 270,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(3 * tp / 200); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_ACC, power = function(tp) return math.floor(3 * tp / 200 - 15); end }
        }
    },
    {   -- Tier 3
        duration = 180,
        mods =
        {
            { id = MOD_MYTHIC_OCC_ATT_TWICE, power = function(tp) return 60; end }
        }
    }
};
aftermathTable[19089] = aftermathTable[19069]; -- Carnwenhan (85)
aftermathTable[19621] = aftermathTable[19069]; -- Carnwenhan (90)

-- Carnwenhan (95)
aftermathTable[19719] =
{
    {   -- Tier 1
        duration = 270,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(tp / 50 + 10); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_ACC, power = function(tp) return math.floor(tp * 0.06 - 80); end }
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
aftermathTable[19828] = aftermathTable[19719]; -- Carnwenhan (99)
aftermathTable[19957] = aftermathTable[19719]; -- Carnwenhan (99/II)
aftermathTable[20561] = aftermathTable[19719]; -- Carnwenhan (119)
aftermathTable[20562] = aftermathTable[19719]; -- Carnwenhan (119/II)
aftermathTable[20586] = aftermathTable[19719]; -- Carnwenhan (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_MORDANT_RIME) then -- Mordant Rime onry
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