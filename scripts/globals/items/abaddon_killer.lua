-----------------------------------------
-- ID: 18293
-- Item: Abaddon Killer
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_ABADDON_KILLER";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_ABADDON_KILLER";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Abaddon Killer 75
aftermathTable[18293] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_DMG, power=-20 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_METATRON_TORMENT) then -- Metatron Torment onry
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
