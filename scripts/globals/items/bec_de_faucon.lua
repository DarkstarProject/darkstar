-----------------------------------------
-- ID: 18305
-- Item: Bec De Faucon
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_BEC_DE_FAUCON";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_BEC_DE_FAUCON";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Bec De Faucon 75
aftermathTable[18305] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=dsp.mod.HASTE_GEAR, power=10 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == dsp.ws.CATASTROPHE) then -- Catastrophe onry
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
