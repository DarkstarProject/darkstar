-----------------------------------------
-- ID: 18336, 18337, 18649, 18663, 18677, 19758, 19851, 21260, 21261, 21267
-- Item: Annihilator
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_ANNIHILATOR";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_ANNIHILATOR";

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {};

-- Annihilator 75
aftermathTable[18336] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp); end,
    mods =
    {
        { id=MOD_ENMITY, power=-20 }
    }
};
aftermathTable[18337] = aftermathTable[18336]; -- Annihilator (80)
aftermathTable[18649] = aftermathTable[18336]; -- Annihilator (85)
aftermathTable[18663] = aftermathTable[18336]; -- Annihilator (90)
aftermathTable[18677] = aftermathTable[18336]; -- Annihilator (95)
aftermathTable[19758] = aftermathTable[18336]; -- Annihilator (99)
aftermathTable[19851] = aftermathTable[18336]; -- Annihilator (99/II)
aftermathTable[21260] = aftermathTable[18336]; -- Annihilator (119)
aftermathTable[21261] = aftermathTable[18336]; -- Annihilator (119/II)

-- Annihilator (119/III)
aftermathTable[21267] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp); end,
    mods =
    {
        { id=MOD_ENMITY, power=-25},
        { id=MOD_RATTP, power=10 }
    }
};

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == WEAPONSKILL_CORONACH) then -- Coronach onry
        local itemId = user:getEquipID(SLOT_RANGED);
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
        local itemId = target:getEquipID(SLOT_RANGED);
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
