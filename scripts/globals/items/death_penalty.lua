-----------------------------------------
-- ID: 19007
-- Item: Death Penalty
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_DEATH_PENALTY";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_DEATH_PENALTY";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Death Penalty (75)
aftermathTable[19007] =
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

-- Death Penalty (80)
aftermathTable[19076] =
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
aftermathTable[19096] = aftermathTable[19076]; -- Death Penalty (85)
aftermathTable[19628] = aftermathTable[19076]; -- Death Penalty (90)

-- Death Penalty (95)
aftermathTable[19726] =
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
aftermathTable[19835] = aftermathTable[19726]; -- Death Penalty (99)
aftermathTable[19964] = aftermathTable[19726]; -- Death Penalty (99/II)
aftermathTable[21262] = aftermathTable[19726]; -- Death Penalty (119)
aftermathTable[21263] = aftermathTable[19726]; -- Death Penalty (119/II)
aftermathTable[21268] = aftermathTable[19726]; -- Death Penalty (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_LEADEN_SALUTE) then -- Leaden Salute onry
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