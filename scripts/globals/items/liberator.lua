-----------------------------------------
-- ID: 18998
-- Item: Liberator
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_LIBERATOR";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_LIBERATOR";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Liberator (75)
aftermathTable[18998] =
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
            { id = MOD_ATT, power = function(tp) return math.floor(2 * tp / 50 - 60); end }
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

-- Liberator (80)
aftermathTable[19067] =
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
            { id = MOD_ATT, power = function(tp) return math.floor(3 * tp / 50 - 90); end }
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
aftermathTable[19087] = aftermathTable[19067]; -- Liberator (85)
aftermathTable[19619] = aftermathTable[19067]; -- Liberator (90)

-- Liberator (95)
aftermathTable[19717] =
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
            { id = MOD_ATT, power = function(tp) return math.floor(tp * 0.06 - 80); end }
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
aftermathTable[19826] = aftermathTable[19717]; -- Liberator (99)
aftermathTable[19955] = aftermathTable[19717]; -- Liberator (99/II)
aftermathTable[20882] = aftermathTable[19717]; -- Liberator (119)
aftermathTable[20883] = aftermathTable[19717]; -- Liberator (119/II)
aftermathTable[21809] = aftermathTable[19717]; -- Liberator (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_INSURGENCY) then -- Insurgency onry
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