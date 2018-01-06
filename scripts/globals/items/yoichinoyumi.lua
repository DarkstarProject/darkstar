-----------------------------------------
-- ID: 18348, 18349, 18650, 18664, 18678, 19759, 19852, 21210, 21211, 22115
-- Item: Yoichinoyumi
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Yoichinoyumi 75
aftermathTable[18348] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_RACC, power=20 }
    }
};
aftermathTable[18349] = aftermathTable[18348]; -- Yoichinoyumi (80)
aftermathTable[18650] = aftermathTable[18348]; -- Yoichinoyumi (85)
aftermathTable[18664] = aftermathTable[18348]; -- Yoichinoyumi (90)
aftermathTable[18678] = aftermathTable[18348]; -- Yoichinoyumi (95)
aftermathTable[19759] = aftermathTable[18348]; -- Yoichinoyumi (99)
aftermathTable[19852] = aftermathTable[18348]; -- Yoichinoyumi (99/II)
aftermathTable[21210] = aftermathTable[18348]; -- Yoichinoyumi (119)
aftermathTable[21211] = aftermathTable[18348]; -- Yoichinoyumi (119/II)

-- Yoichinoyumi (119/III)
aftermathTable[22115] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_RACC, power=30 },
        { id=MOD_SNAP_SHOT, power=5 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_NAMAS_ARROW) then -- Namas Arrow onry
        local itemId = user:getWeaponID(SLOT_RANGED);
        if (aftermathTable[itemId]) then
            -- Apply the effect and add mods
            addAftermathEffect(user, tp, aftermathTable[itemId]);
            -- Add a listener for when aftermath wears (to remove mods)
            user:addListener("EFFECT_LOSE", "AFTERMATH_LOST", aftermathLost);
        end
    end
end

function aftermathLost(target, effect)
    if (effect:getType() == EFFECT_AFTERMATH) then
        local itemId = target:getWeaponID(SLOT_RANGED);
        if (aftermathTable[itemId]) then
            -- Remove mods
            removeAftermathEffect(target, aftermathTable[itemId]);
            -- Remove the effect listener
            target:removeListener("AFTERMATH_LOST");
        end
    end
end

function onItemCheck(player, param, caster)
    if (param == ITEMCHECK_EQUIP) then
        player:addListener("WEAPONSKILL_USE", "AFTERMATH", onWeaponskill);
    elseif (param == ITEMCHECK_UNEQUIP) then
        -- Make sure we clean up the effect and mods
        if (player:hasStatusEffect(EFFECT_AFTERMATH)) then
            aftermathLost(player, player:getStatusEffect(EFFECT_AFTERMATH))
        end
        player:removeListener("AFTERMATH");
    end
end
