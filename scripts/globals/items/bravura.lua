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
        { id=dsp.mod.DMG, power=-20 }
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
        { id=dsp.mod.DMG, power=-20 },
        { id=dsp.mod.REGEN, power=15 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == dsp.ws.METATRON_TORMENT) then -- Metatron Torment onry
        local itemId = user:getEquipID(dsp.slot.MAIN);
        if (aftermathTable[itemId]) then
            -- Apply the effect and add mods
            addAftermathEffect(user, tp, aftermathTable[itemId]);
            -- Add a listener for when aftermath wears (to remove mods)
            user:addListener("EFFECT_LOSE", NAME_EFFECT_LOSE, aftermathLost);
        end
    end
end

function aftermathLost(target, effect)
    if (effect:getType() == dsp.effect.AFTERMATH) then
        local itemId = target:getEquipID(dsp.slot.MAIN);
        if (aftermathTable[itemId]) then
            -- Remove mods
            removeAftermathEffect(target, aftermathTable[itemId]);
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

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effect.EVASION_BOOST)
        target:addStatusEffect(dsp.effect.EVASION_DOWN, 15, 0, 60);
        return dsp.subEffect.EVASION_DOWN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.EVASION_DOWN;
    end
end;
