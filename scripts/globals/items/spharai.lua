-----------------------------------------
-- ID: 18264, 18265, 18637, 18651, 18665, 19746, 19839, 20480, 20481, 20509
-- Item: Spharai
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_SPHARAI";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_SPHARAI";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Spharai 75
aftermathTable[18264] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_SUBTLE_BLOW, power=10 }
    }
};
aftermathTable[18265] = aftermathTable[18264]; -- Spharai (80)
aftermathTable[18637] = aftermathTable[18264]; -- Spharai (85)
aftermathTable[18651] = aftermathTable[18264]; -- Spharai (90)
aftermathTable[18665] = aftermathTable[18264]; -- Spharai (95)
aftermathTable[19746] = aftermathTable[18264]; -- Spharai (99)
aftermathTable[19839] = aftermathTable[18264]; -- Spharai (99/II)
aftermathTable[20480] = aftermathTable[18264]; -- Spharai (119)
aftermathTable[20481] = aftermathTable[18264]; -- Spharai (119/II)

-- Spharai (119/III)
aftermathTable[20509] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_SUBTLE_BLOW, power=10 },
        { id=MOD_KICK_ATTACK, power=15 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_FINAL_HEAVEN) then -- Final Heaven onry
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
