-----------------------------------------
-- ID: 19469
-- Item: Armageddon
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_ARMAGEDDON";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_ARMAGEDDON";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Armageddon 85
aftermathTable[19469] =
{
    { -- Tier 1
        duration = 30,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG_RANGED, power = 30 }
        }
    },
    { -- Tier 2
        duration = 60,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG_RANGED, power = 40 }
        }
    },
    { -- Tier 3
        duration = 60,
        mods =
        {
            { id = MOD_REM_OCC_DO_DOUBLE_DMG_RANGED, power = 50 }
        }
    }
};
aftermathTable[19547] = aftermathTable[19469]; -- Armageddon (90)
aftermathTable[19646] = aftermathTable[19469]; -- Armageddon (95)
aftermathTable[19818] = aftermathTable[19469]; -- Armageddon (99)
aftermathTable[19866] = aftermathTable[19469]; -- Armageddon (99/II)
aftermathTable[21264] = aftermathTable[19469]; -- Armageddon (119)
aftermathTable[21265] = aftermathTable[19469]; -- Armageddon (119/II)

-- Armageddon (119/III)
aftermathTable[21269] =
{
    { -- Tier 1
        duration = 60,
        mods =
        {
            { id = MOD_REM_OCC_DO_TRIPLE_DMG_RANGED, power = 30 }
        }
    },
    { -- Tier 2
        duration = 120,
        mods =
        {
            { id = MOD_REM_OCC_DO_TRIPLE_DMG_RANGED, power = 40 }
        }
    },
    { -- Tier 3
        duration = 180,
        mods =
        {
            { id = MOD_REM_OCC_DO_TRIPLE_DMG_RANGED, power = 50 }
        }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_WILDFIRE) then -- Wildfire onry
        local itemId = user:getEquipID(SLOT_RANGED);
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
        local itemId = target:getEquipID(SLOT_RANGED);
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
