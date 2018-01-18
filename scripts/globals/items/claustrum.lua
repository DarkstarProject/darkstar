-----------------------------------------
-- ID: 18330, 18331, 18648, 18662, 18676, 19757, 19850, 21135, 21136, 22060
-- Item: Claustrum
-- Additional Effect: Dispel
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_CLAUSTRUM";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_CLAUSTRUM";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Claustrum 75
aftermathTable[18330] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_REFRESH, power=8 }
    }
};
aftermathTable[18331] = aftermathTable[18330]; -- Claustrum (80)
aftermathTable[18648] = aftermathTable[18330]; -- Claustrum (85)
aftermathTable[18662] = aftermathTable[18330]; -- Claustrum (90)
aftermathTable[18676] = aftermathTable[18330]; -- Claustrum (95)
aftermathTable[19757] = aftermathTable[18330]; -- Claustrum (99)
aftermathTable[19850] = aftermathTable[18330]; -- Claustrum (99/II)
aftermathTable[21135] = aftermathTable[18330]; -- Claustrum (119)
aftermathTable[21136] = aftermathTable[18330]; -- Claustrum (119/II)

-- Claustrum (119/III)
aftermathTable[22060] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_REFRESH, power=15 },
        { id=MOD_DMG, power=-20 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_GATE_OF_TARTARUS) then -- Gate Of Tartarus onry
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
    local chance = 15;
    if (chance > math.random(0,99)) then
        local dispel = target:dispelStatusEffect();
        if (dispel == EFFECT_NONE) then
            return 0,0,0;
        else
            return SUBEFFECT_DISPEL, msgBasic.ADD_EFFECT_DISPEL, dispel;
        end
    else
        return 0,0,0;
    end
end;