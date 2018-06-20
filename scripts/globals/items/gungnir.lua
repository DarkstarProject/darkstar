-----------------------------------------
-- ID: 18300, 18301, 18643, 18657, 18671, 19752, 19845, 20925, 20926, 21857
-- Item: Gungnir
-- Additional Effect: Weakens Defense
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_GUNGNIR";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_GUNGNIR";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Gungnir 75
aftermathTable[18300] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=dsp.mod.SPIKES, power=dsp.subEffect.SHOCK_SPIKES },
        { id=dsp.mod.SPIKES_DMG, power=10 }
    }
};
aftermathTable[18301] = aftermathTable[18300]; -- Gungnir (80)
aftermathTable[18643] = aftermathTable[18300]; -- Gungnir (85)
aftermathTable[18657] = aftermathTable[18300]; -- Gungnir (90)
aftermathTable[18671] = aftermathTable[18300]; -- Gungnir (95)
aftermathTable[19752] = aftermathTable[18300]; -- Gungnir (99)
aftermathTable[19845] = aftermathTable[18300]; -- Gungnir (99/II)
aftermathTable[20925] = aftermathTable[18300]; -- Gungnir (119)
aftermathTable[20926] = aftermathTable[18300]; -- Gungnir (119/II)

-- Gungnir (119/III)
aftermathTable[21857] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=dsp.mod.SPIKES, power=dsp.subEffect.SHOCK_SPIKES },
        { id=dsp.mod.SPIKES_DMG, power=10 },
        { id=dsp.mod.ATTP, power=5 },
        { id=dsp.mod.DOUBLE_ATTACK, power=5 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == dsp.ws.GEIRSKOGUL) then -- Gierskogul onry
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

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.WIND,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effect.DEFENSE_BOOST)
        target:addStatusEffect(dsp.effect.DEFENSE_DOWN, 17, 0, 60); -- Power and duration needs verification
        return dsp.subEffect.DEFENSE_DOWN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.DEFENSE_DOWN;
    end
end;