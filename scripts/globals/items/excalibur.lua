-----------------------------------------
-- ID: 18276, 18277, 18639, 18653, 18667, 18748, 19841, 20645, 20646, 20685
-- Item: Excalibur
-- Additional Effect: Damage proportionate to current HP (25% Current HP)
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_EXCALBIUR";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_EXCALIBUR";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Excalibur 75
aftermathTable[18276] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_REGEN, power=10 }
    }
};
aftermathTable[18277] = aftermathTable[18276]; -- Excalibur (80)
aftermathTable[18639] = aftermathTable[18276]; -- Excalibur (85)
aftermathTable[18653] = aftermathTable[18276]; -- Excalibur (90)
aftermathTable[18667] = aftermathTable[18276]; -- Excalibur (95)
aftermathTable[18748] = aftermathTable[18276]; -- Excalibur (99)
aftermathTable[19841] = aftermathTable[18276]; -- Excalibur (99/II)
aftermathTable[20645] = aftermathTable[18276]; -- Excalibur (119)
aftermathTable[20646] = aftermathTable[18276]; -- Excalibur (119/II)

-- Excalibur (119/III)
aftermathTable[20685] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_REGEN, power=30 },
        { id=MOD_REFRESH, power=3 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_KNIGHTS_OF_ROUND) then -- Knights Of Round onry
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
        local finalDMG = math.floor(player.getHP(player)/4);
        if (finalDMG > 0) then
            local physicalResist = target:getMod(MOD_SLASHRES)/1000;
            finalDMG = finalDMG*physicalResist;
            finalDMG = target:physicalDmgTaken(finalDMG);
            finalDMG = finalDMG - target:getMod(MOD_PHALANX);
            finalDMG = utils.clamp(finalDMG, 0, 99999);
            finalDMG = utils.stoneskin(target, finalDMG);
            target:delHP(finalDMG);
            return SUBEFFECT_LIGHT_DAMAGE, msgBasic.ADD_EFFECT_DMG, finalDMG;
        end
    end
end;
