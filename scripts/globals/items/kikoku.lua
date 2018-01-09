-----------------------------------------
-- ID: 18312, 18313, 18645, 18659, 18673, 19754, 19847, 20970, 20971, 21906
-- Item: Kikoku
-- Additional Effect: Paralysis
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_KIKOKU";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_KIKOKU";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Kikoku 75
aftermathTable[18312] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_SUBTLE_BLOW, power=10 }
    }
};
aftermathTable[18313] = aftermathTable[18312]; -- Kikoku (80)
aftermathTable[18645] = aftermathTable[18312]; -- Kikoku (85)
aftermathTable[18659] = aftermathTable[18312]; -- Kikoku (90)
aftermathTable[18673] = aftermathTable[18312]; -- Kikoku (95)
aftermathTable[19754] = aftermathTable[18312]; -- Kikoku (99)
aftermathTable[19847] = aftermathTable[18312]; -- Kikoku (99/II)
aftermathTable[20970] = aftermathTable[18312]; -- Kikoku (119)
aftermathTable[20971] = aftermathTable[18312]; -- Kikoku (119/II)

-- Kikoku (119/III)
aftermathTable[21906] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_SUBTLE_BLOW, power=10 },
        { id=MOD_ATTP, power=10 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_BLADE_METSU) then -- Blade: Metsu onry
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

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_PARALYSIS, 17, 0, 30); -- Power needs verification/adjustment.
        return SUBEFFECT_PARALYSIS, msgBasic.ADD_EFFECT_STATUS, EFFECT_PARALYSIS;
    end
end;