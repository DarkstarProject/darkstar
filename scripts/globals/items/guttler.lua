-----------------------------------------
-- ID: 18288, 18289, 18641, 18655, 18669, 19750, 19843, 20790, 20791, 21750
-- Item: Guttler
-- Additional Effect: Choke
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
require("scripts/globals/weaponskillids");
require("scripts/globals/weaponskills");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_GUTTLER";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_GUTTLER";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Guttler 75
aftermathTable[18288] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_ATTP, power=10 }
    }
};
aftermathTable[18289] = aftermathTable[18288]; -- Guttler (80)
aftermathTable[18641] = aftermathTable[18288]; -- Guttler (85)
aftermathTable[18655] = aftermathTable[18288]; -- Guttler (90)
aftermathTable[18669] = aftermathTable[18288]; -- Guttler (95)
aftermathTable[19750] = aftermathTable[18288]; -- Guttler (99)
aftermathTable[19843] = aftermathTable[18288]; -- Guttler (99/II)
aftermathTable[20790] = aftermathTable[18288]; -- Guttler (119)
aftermathTable[20791] = aftermathTable[18288]; -- Guttler (119/II)

-- Guttler (119/III)
aftermathTable[21750] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_ATTP, power=10 },
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

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_CHOKE, 17, 0, 60);
        return SUBEFFECT_CHOKE, msgBasic.ADD_EFFECT_STATUS, EFFECT_CHOKE;
    end
end;