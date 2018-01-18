-----------------------------------------
-- ID: 19001
-- Item: Gastraphetes
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_GASTRAPHETES";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_GASTRAPHETS";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Gastraphetes (75)
aftermathTable[19001] =
{
    {   -- Tier 1
        duration = 60,
        mods =
        {
            { id = MOD_RACC, power = function(tp) return math.floor(tp / 100); end }
        }
    },
    {   -- Tier 2
        duration = 90,
        mods =
        {
            { id = MOD_RATT, power = function(tp) return math.floor(2 * tp / 50 - 60); end }
        }
    },
    {   -- Tier 3
        duration = 120,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG_RANGED, power = function(tp) return 40; end }
        }
    }
};

-- Gastraphetes (80)
aftermathTable[19070] =
{
    {   -- Tier 1
        duration = 90,
        mods =
        {
            { id = MOD_RACC, power = function(tp) return math.floor(tp / 50); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_RATT, power = function(tp) return math.floor(3 * tp / 50 - 90); end }
        }
    },
    {   -- Tier 3
        duration = 180,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG_RANGED, power = function(tp) return 60; end }
        }
    }
};
aftermathTable[19090] = aftermathTable[19070]; -- Gastraphetes (85)
aftermathTable[19622] = aftermathTable[19070]; -- Gastraphetes (90)

-- Gastraphetes (95)
aftermathTable[19720] =
{
    {   -- Tier 1
        duration = 90,
        mods =
        {
            { id = MOD_RACC, power = function(tp) return math.floor(tp / 50 + 10); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_RATT, power = function(tp) return math.floor(tp * 0.06 - 80); end }
        }
    },
    {   -- Tier 3
        duration = 180,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG_RANGED, power = function(tp) return 40; end },
            { id = MOD_REM_OCC_DO_TRIPLE_DMG_RANGED, power = function(tp) return 20; end }
        }
    }
};
aftermathTable[19829] = aftermathTable[19720]; -- Gastraphetes (99)
aftermathTable[19958] = aftermathTable[19720]; -- Gastraphetes (99/II)
aftermathTable[21246] = aftermathTable[19720]; -- Gastraphetes (119)
aftermathTable[21247] = aftermathTable[19720]; -- Gastraphetes (119/II)
aftermathTable[21266] = aftermathTable[19720]; -- Gastraphetes (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_TRUEFLIGHT) then -- Trueflight onry
        if (shouldApplyAftermath(user, tp)) then
            local itemId = user:getEquipID(SLOT_RANGED);
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
        local itemId = target:getEquipID(SLOT_RANGED);
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