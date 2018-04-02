-----------------------------------------
-- ID: 18294, 18295, 18642, 18656, 18670, 19751, 19844, 20835, 20836, 21756
-- Item: Bravura
-- Additional Effect: Impairs evasion
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_BRAVURA";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_BRAVURA";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Bravura 75
aftermathTable[18294] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_DMG, power=-20 }
    }
};
aftermathTable[18295] = aftermathTable[18294]; -- Bravura (80)
aftermathTable[18642] = aftermathTable[18294]; -- Bravura (85)
aftermathTable[18656] = aftermathTable[18294]; -- Bravura (90)
aftermathTable[18670] = aftermathTable[18294]; -- Bravura (95)
aftermathTable[19751] = aftermathTable[18294]; -- Bravura (99)
aftermathTable[19844] = aftermathTable[18294]; -- Bravura (99/II)
aftermathTable[20835] = aftermathTable[18294]; -- Bravura (119)
aftermathTable[20836] = aftermathTable[18294]; -- Bravura (119/II)

-- Bravura (119/III)
aftermathTable[21756] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_DMG, power=-20 },
        { id=MOD_REGEN, power=15 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_METATRON_TORMENT) then -- Metatron Torment onry
        local itemId = user:getEquipID(SLOT_MAIN);
        if (aftermathTable[itemId]) then
            -- Apply the effect and add mods
            addAftermathEffect(user, tp, aftermathTable[itemId]);
            -- Add a listener for when aftermath wears (to remove mods)
            user:addListener("dsp.effects.LOSE", NAME_EFFECT_LOSE, aftermathLost);
        end
    end
end

function aftermathLost(target, effect)
    if (effect:getType() == dsp.effects.AFTERMATH) then
        local itemId = target:getEquipID(SLOT_MAIN);
        if (aftermathTable[itemId]) then
            -- Remove mods
            removeAftermathEffect(target, aftermathTable[itemId]);
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

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effects.EVASION_BOOST)
        target:addStatusEffect(dsp.effects.EVASION_DOWN, 15, 0, 60);
        return SUBEFFECT_EVASION_DOWN, msgBasic.ADD_EFFECT_STATUS, dsp.effects.EVASION_DOWN;
    end
end;
