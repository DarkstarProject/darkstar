-----------------------------------------
-- ID: 14662
-- Teleport ring: Dem
-- Enchantment: "Teleport-Dem"
-----------------------------------------

require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/teleports")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasKeyItem(dsp.ki.DEM_GATE_CRYSTAL) == false) then
        result = 445
    end
    return result
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.DEM,0,1)
end
