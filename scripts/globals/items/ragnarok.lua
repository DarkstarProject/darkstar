-----------------------------------------
-- ID: 18282, 18283, 18640, 18654, 18668, 19749, 19842, 20745, 20746, 21683
-- Item: Ragnarok
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_RAGNAROK";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_RAGNAROK";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Ragnarok 75
aftermathTable[18282] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_CRITHITRATE, power=5 }
    }
};
aftermathTable[18283] = aftermathTable[18282]; -- Ragnarok (80)
aftermathTable[18640] = aftermathTable[18282]; -- Ragnarok (85)
aftermathTable[18654] = aftermathTable[18282]; -- Ragnarok (90)
aftermathTable[18668] = aftermathTable[18282]; -- Ragnarok (95)
aftermathTable[19749] = aftermathTable[18282]; -- Ragnarok (99)
aftermathTable[19842] = aftermathTable[18282]; -- Ragnarok (99/II)
aftermathTable[20745] = aftermathTable[18282]; -- Ragnarok (119)
aftermathTable[20746] = aftermathTable[18282]; -- Ragnarok (119/II)

-- Ragnarok (119/III)
aftermathTable[21683] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_CRITHITRATE, power=10 },
        { id=MOD_ACC, power=15 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_SCOURGE) then -- Scourge onry
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
