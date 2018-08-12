-----------------------------------------
-- ID: 18348, 18349, 18650, 18664, 18678, 19759, 19852, 21210, 21211, 22115
-- Item: Yoichinoyumi
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_YOICHI";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_YOICHI";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Yoichinoyumi 75
aftermathTable[18348] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=dsp.mod.RACC, power=20 }
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
        { id=dsp.mod.RACC, power=30 },
        { id=dsp.mod.SNAP_SHOT, power=5 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == dsp.ws.NAMAS_ARROW) then -- Namas Arrow onry
        local itemId = user:getEquipID(dsp.slot.RANGED);
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
        local itemId = target:getEquipID(dsp.slot.RANGED);
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

function onItemUse(target)
    target:addItem(21299,99);
    target:messageSpecial(ITEMS_OBTAINED,21299,99);
end;
