-----------------------------------------
-- ID: 19467
-- Item: Hvergelmir
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_HVERGELMIR";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_HVERGELMIR";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Hvergelmir 85
aftermathTable[19467] =
{
    { -- Tier 1
        duration = 30,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG, power = 30 }
        }
    },
    { -- Tier 2
        duration = 60,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG, power = 40 }
        }
    },
    { -- Tier 3
        duration = 60,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG, power = 50 }
        }
    }
};
aftermathTable[19545] = aftermathTable[19467]; -- Hvergelmir (90)
aftermathTable[19644] = aftermathTable[19467]; -- Hvergelmir (95)
aftermathTable[19816] = aftermathTable[19467]; -- Hvergelmir (99)
aftermathTable[19864] = aftermathTable[19467]; -- Hvergelmir (99/II)
aftermathTable[21144] = aftermathTable[19467]; -- Hvergelmir (119)
aftermathTable[21145] = aftermathTable[19467]; -- Hvergelmir (119/II)

-- Hvergelmir (119/III)
aftermathTable[22064] =
{
    { -- Tier 1
        duration = 60,
        mods =
        {
            { id = MOD_REM_OCC_DO_TRIPLE_DMG, power = 30 }
        }
    },
    { -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_REM_OCC_DO_TRIPLE_DMG, power = 40 }
        }
    },
    { -- Tier 3
        duration = 180,
        mods =
        {
            { id = MOD_REM_OCC_DO_TRIPLE_DMG, power = 50 }
        }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_MYRKR) then -- Myrkr onry
        local itemId = user:getEquipID(SLOT_MAIN);
        if (shouldApplyAftermath(user, tp)) then
            if (aftermathTable[itemId]) then
                -- Apply the effect and add mods
                addEmpyreanAftermathEffect(user, tp, aftermathTable[itemId]);
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
            removeEmpyreanAftermathEffect(target, effect, aftermathTable[itemId]);
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
