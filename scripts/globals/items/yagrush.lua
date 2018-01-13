-----------------------------------------
-- ID: 18993
-- Item: Yagrush
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_YAGRUSH";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_YAGRUSH";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Yagrush (75)
aftermathTable[18993] =
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
            { id = MOD_OCC_ATT_TWICE, power = function(tp) return 40; end }
        }
    }
};

-- Yagrush (80)
aftermathTable[19062] =
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
            { id = MOD_OCC_ATT_TWICE, power = function(tp) return 60; end }
        }
    }
};
aftermathTable[19082] = aftermathTable[19062]; -- Yagrush (85)
aftermathTable[19614] = aftermathTable[19062]; -- Yagrush (90)

-- Yagrush (95)
aftermathTable[19712] =
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
            { id = MOD_ACC, power = function(tp) return math.floor(tp / 50 - 10); end }
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
aftermathTable[19821] = aftermathTable[19712]; -- Yagrush (99)
aftermathTable[19950] = aftermathTable[19712]; -- Yagrush (99/II)
aftermathTable[21062] = aftermathTable[19712]; -- Yagrush (119)
aftermathTable[21063] = aftermathTable[19712]; -- Yagrush (119/II)
aftermathTable[21078] = aftermathTable[19712]; -- Yagrush (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_MYSTIC_BOON) then -- Mystic Boon onry
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