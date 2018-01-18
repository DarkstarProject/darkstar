-----------------------------------------
-- ID: 18994
-- Item: Laevateinn
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_LAEVATEINN";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_LAEVATEINN";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Laevateinn (75)
aftermathTable[18994] =
{
    {   -- Tier 1
        duration = 180,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(tp / 100); end }
        }
    },
    {   -- Tier 2
        duration = 180,
        mods =
        {
            { id = MOD_MATT, power = function(tp) return math.floor(tp / 100); end }
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

-- Laevateinn (80)
aftermathTable[19063] =
{
    {   -- Tier 1
        duration = 270,
        mods =
        {
            { id = MOD_MACC, power = function(tp) return math.floor(3 * tp / 200); end }
        }
    },
    {   -- Tier 2
        duration = 270,
        mods =
        {
            { id = MOD_MATT, power = function(tp) return math.floor(tp / 50 - 20); end }
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
aftermathTable[19083] = aftermathTable[19063]; -- Laevateinn (85)
aftermathTable[19615] = aftermathTable[19063]; -- Laevateinn (90)

-- Laevateinn (95)
aftermathTable[19713] =
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
            { id = MOD_MATT, power = function(tp) return math.floor(tp / 50 - 10); end }
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
aftermathTable[19822] = aftermathTable[19713]; -- Laevateinn (99)
aftermathTable[19951] = aftermathTable[19713]; -- Laevateinn (99/II)
aftermathTable[21139] = aftermathTable[19713]; -- Laevateinn (119)
aftermathTable[21140] = aftermathTable[19713]; -- Laevateinn (119/II)
aftermathTable[22062] = aftermathTable[19713]; -- Laevateinn (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_VIDOHUNIR) then -- Vidohunir onry
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