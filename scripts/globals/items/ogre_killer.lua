-----------------------------------------
-- ID: 18287
-- Item: Ogre Killer
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskillids");
require("scripts/globals/weaponskills");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_OGRE_KILLER";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_OGRE_KILLER";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Ogre Killer 75
aftermathTable[18287] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_ATTP, power=10 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_ONSLAUGHT) then -- Onslaught onry
        local itemId = user:getEquipID(SLOT_MAIN);
        if (aftermathTable[itemId]) then
            -- Apply the effect and add mods
            addAftermathEffect(user, tp, aftermathTable[itemId]);
            -- If tier 2 aftermath, apply to pet
            if (aftermathTable[itemId].power == 2) then
                local pet = user:getPet();
                if (pet) then
                    addAftermathEffect(pet, tp, aftermathTable[itemId]);
                end
            end
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
            -- If tier 2 aftermath, remove from pet
            if (aftermathTable[itemId].power == 2) then
                local pet = target:getPet();
                if (pet) then
                    removeAftermathEffect(pet, aftermathTable[itemId]);
                end
            end
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