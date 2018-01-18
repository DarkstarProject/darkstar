-----------------------------------------
-- ID: 18270, 18271, 18638, 18652, 18666, 19747, 19840, 20555, 20556, 20583
-- Item: Mandau
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_MANDAU";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_MANDAU";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Mandau 75
aftermathTable[18270] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_CRITHITRATE, power=5 }
    }
};
aftermathTable[18271] = aftermathTable[18270]; -- Mandau (80)
aftermathTable[18638] = aftermathTable[18270]; -- Mandau (85)
aftermathTable[18652] = aftermathTable[18270]; -- Mandau (90)
aftermathTable[18666] = aftermathTable[18270]; -- Mandau (95)
aftermathTable[19747] = aftermathTable[18270]; -- Mandau (99)
aftermathTable[19840] = aftermathTable[18270]; -- Mandau (99/II)
aftermathTable[20555] = aftermathTable[18270]; -- Mandau (119)
aftermathTable[20556] = aftermathTable[18270]; -- Mandau (119/II)

-- Mandau (119/III)
aftermathTable[20583] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_CRITHITRATE, power=5 },
        { id=MOD_CRIT_DMG_INCREASE, power=5 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_MERCY_STROKE) then -- Mercy Stroke onry
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

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_POISON, 10, 3, 30); -- Power and Duration needs verified.
        return SUBEFFECT_POISON, msgBasic.ADD_EFFECT_STATUS, EFFECT_POISON;
    end
    
    return 0;
end
