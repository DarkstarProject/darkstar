-----------------------------------------
-- ID: 13180
-- Item: Republic Stables Medal
-- Teleports to Chocobo Stables (Bastok)
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.CHOCOBASTOK,0,4)
end