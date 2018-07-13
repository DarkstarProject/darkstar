-----------------------------------------
-- ID: 19464
-- Item: Kannagi
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_KANNAGI";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_KANNAGI";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Kannagi 85
aftermathTable[19464] =
{
    { -- Tier 1
        duration = 30,
        mods =
        {
            { id = dsp.mod.REM_OCC_DO_DOUBLE_DMG, power = 30 }
        }
    },
    { -- Tier 2
        duration = 60,
        mods =
        {
            { id = dsp.mod.REM_OCC_DO_DOUBLE_DMG, power = 40 }
        }
    },
    { -- Tier 3
        duration = 60,
        mods =
        {
            { id = dsp.mod.REM_OCC_DO_DOUBLE_DMG, power = 50 }
        }
    }
};
aftermathTable[19542] = aftermathTable[19464]; -- Kannagi (90)
aftermathTable[19641] = aftermathTable[19464]; -- Kannagi (95)
aftermathTable[19813] = aftermathTable[19464]; -- Kannagi (99)
aftermathTable[19861] = aftermathTable[19464]; -- Kannagi (99/II)
aftermathTable[20974] = aftermathTable[19464]; -- Kannagi (119)
aftermathTable[20975] = aftermathTable[19464]; -- Kannagi (119/II)

-- Kannagi (119/III)
aftermathTable[21908] =
{
    { -- Tier 1
        duration = 60,
        mods =
        {
            { id = dsp.mod.REM_OCC_DO_TRIPLE_DMG, power = 30 }
        }
    },
    { -- Tier 2
        duration = 120,
        mods =
        {
            { id = dsp.mod.REM_OCC_DO_TRIPLE_DMG, power = 40 }
        }
    },
    { -- Tier 3
        duration = 180,
        mods =
        {
            { id = dsp.mod.REM_OCC_DO_TRIPLE_DMG, power = 50 }
        }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == dsp.ws.BLADE_HI) then -- Blade: Hi onry
        local itemId = user:getEquipID(dsp.slot.MAIN);
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
    if (effect:getType() == dsp.effect.AFTERMATH) then
        local itemId = target:getEquipID(dsp.slot.MAIN);
        if (aftermathTable[itemId]) then
            -- Remove mods
            removeEmpyreanAftermathEffect(target, effect, aftermathTable[itemId]);
            -- Remove the effect listener
            target:removeListener(NAME_EFFECT_LOSE);
        end
    end
end

function onItemCheck(player, param, caster)
    if (param == dsp.itemCheck.EQUIP) then
        player:addListener("WEAPONSKILL_USE", NAME_WEAPONSKILL, onWeaponskill);
    elseif (param == dsp.itemCheck.UNEQUIP) then
        -- Make sure we clean up the effect and mods
        if (player:hasStatusEffect(dsp.effect.AFTERMATH)) then
            aftermathLost(player, player:getStatusEffect(dsp.effect.AFTERMATH));
        end
        player:removeListener(NAME_WEAPONSKILL);
    end
    
    return 0;
end
