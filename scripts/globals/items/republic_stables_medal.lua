-----------------------------------------
-- ID: 13180
-- Item: Republic Stables Medal
-- Teleports to Chocobo Stables (Bastok)
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
require("scripts/globals/zone")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:isZoneVisited(dsp.zone.BASTOK_MINES) then
        result = dsp.msg.basic.ITEM_UNABLE_TO_USE_2
    end
    return result
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.CHOCO_BASTOK,0,4)
end