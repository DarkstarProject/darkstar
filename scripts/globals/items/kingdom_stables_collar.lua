-----------------------------------------
-- ID: 13179
-- Item: Kingdom Stables Collar
-- Teleports to Chocobo Stables (San d'Oria)
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.CHOCOSANDORIA,0,4)
end