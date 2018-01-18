-----------------------------------------
-- ID: 18324, 18325, 18647, 18661, 18675, 19756, 19849, 21060, 21061, 21077
-- Item: Mjollnir
-- Additional Effect: Recover MP
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_MJOLLNIR";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_MJOLLNIR";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Mjollnir 75
aftermathTable[18324] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_ACC, power=20 }
    }
};
aftermathTable[18325] = aftermathTable[18324]; -- Mjollnir (80)
aftermathTable[18647] = aftermathTable[18324]; -- Mjollnir (85)
aftermathTable[18661] = aftermathTable[18324]; -- Mjollnir (90)
aftermathTable[18675] = aftermathTable[18324]; -- Mjollnir (95)
aftermathTable[19756] = aftermathTable[18324]; -- Mjollnir (99)
aftermathTable[19849] = aftermathTable[18324]; -- Mjollnir (99/II)
aftermathTable[21060] = aftermathTable[18324]; -- Mjollnir (119)
aftermathTable[21061] = aftermathTable[18324]; -- Mjollnir (119/II)

-- Mjollnir (119/III)
aftermathTable[21077] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_ACC, power=20 },
        { id=MOD_MACC, power=20 },
        { id=MOD_REFRESH, power=5 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_RANDGRITH) then -- Randgrith onry
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

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local mp = math.random(4,16);
        player:addMP(mp);
        player:messageBasic(msgBasic.RECOVERS_MP, 0, mp);
        return 0,0,0; -- Function REQUIRES a return or will error!
    end
end;