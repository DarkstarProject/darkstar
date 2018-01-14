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
        { id=MOD_SPIKES, power=SUBEFFECT_SHOCK_SPIKES },
        { id=MOD_SPIKES_DMG, power=10 }
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
        { id=MOD_SPIKES, power=SUBEFFECT_SHOCK_SPIKES },
        { id=MOD_SPIKES_DMG, power=10 },
        { id=MOD_ATTP, power=5 },
        { id=MOD_DOUBLE_ATTACK, power=5 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_GEIRSKOGUL) then -- Gierskogul onry
        local itemId = user:getEquipID(SLOT_MAIN);
        if (aftermathTable[itemId]) then
            -- Apply the effect and add mods
            addAftermathEffect(user, tp, aftermathTable[itemId]);
            -- Add a listener for when aftermath wears (to remove mods)
            user:addListener("EFFECT_LOSE", NAME_EFFECT_LOSE, aftermathLost);
        end
    end
end

function aftermathLost(target, effect)
    if (effect:getType() == EFFECT_AFTERMATH) then
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
        if (player:hasStatusEffect(EFFECT_AFTERMATH)) then
            aftermathLost(player, player:getStatusEffect(EFFECT_AFTERMATH));
        end
        player:removeListener(NAME_WEAPONSKILL);
    end
    
    return 0;
end

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_DEFENSE_BOOST)
        target:addStatusEffect(EFFECT_DEFENSE_DOWN, 17, 0, 60); -- Power and duration needs verification
        return SUBEFFECT_DEFENSE_DOWN, msgBasic.ADD_EFFECT_STATUS, EFFECT_DEFENSE_DOWN;
    end
end;