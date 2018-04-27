-----------------------------------------
-- ID: 18990
-- Item: Tupsimati
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_TERPSICHORE";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_TERPSICHORE";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Tupsimati (75)
aftermathTable[18990] =
{
    {   -- Tier 1
        duration = 60,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(tp / 100); end }
        }
    },
    {   -- Tier 2
        duration = 90,
        mods =
        {
            { id = MOD_MATT, power = function(tp) return math.floor(2 * tp / 50 - 60); end }
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

-- Tupsimati (80)
aftermathTable[19079] =
{
    {   -- Tier 1
        duration = 90,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(3 * tp / 200); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_MATT, power = function(tp) return math.floor(3 * tp / 50 - 90); end }
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
aftermathTable[19099] = aftermathTable[19079]; -- Tupsimati (85)
aftermathTable[19631] = aftermathTable[19079]; -- Tupsimati (90)

-- Tupsimati (95)
aftermathTable[19729] =
{
    {   -- Tier 1
        duration = 90,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(tp / 50 + 10); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_MATT, power = function(tp) return math.floor(tp * 0.06 - 80); end }
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
aftermathTable[19838] = aftermathTable[19729]; -- Tupsimati (99)
aftermathTable[19967] = aftermathTable[19729]; -- Tupsimati (99/II)
aftermathTable[21137] = aftermathTable[19729]; -- Tupsimati (119)
aftermathTable[21138] = aftermathTable[19729]; -- Tupsimati (119/II)
aftermathTable[22061] = aftermathTable[19729]; -- Tupsimati (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_OMNISCIENCE) then -- Omniscience onry
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
    if (effect:getType() == dsp.effects.AFTERMATH) then
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
        if (player:hasStatusEffect(dsp.effects.AFTERMATH)) then
            aftermathLost(player, player:getStatusEffect(dsp.effects.AFTERMATH));
        end
        player:removeListener(NAME_WEAPONSKILL);
    end
    
    return 0;
end