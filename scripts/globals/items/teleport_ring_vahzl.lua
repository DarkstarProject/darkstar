-----------------------------------------
-- ID: 14664
-- Teleport ring: Vahzl
-- Enchantment: "Teleport-Vahzl"
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasKeyItem(VAHZL_GATE_CRYSTAL) == false) then
        result = 445;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_VAHZL,0,1);
end
