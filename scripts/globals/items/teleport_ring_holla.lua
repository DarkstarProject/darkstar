-----------------------------------------
-- ID: 14661
-- Teleport ring: Holla
-- Enchantment: "Teleport-Holla"
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasKeyItem(HOLLA_GATE_CRYSTAL) == false) then
        result = 445;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffectEx(dsp.effects.TELEPORT,0,TELEPORT_HOLLA,0,1);
end;
