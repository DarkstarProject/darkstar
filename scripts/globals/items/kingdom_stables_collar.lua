-----------------------------------------
-- ID: 13179
-- Item: Kingdom Stables Collar
-- Teleports to Chocobo Stables (San d'Oria)
-----------------------------------------
require("scripts/globals/teleports");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:isZoneVisited(230) then
        result = 56
    end
    return result
end;

function onItemUse(target)
    target:addStatusEffectEx(dsp.effects.TELEPORT,0,TELEPORT_CHOCOSANDORIA,0,4);
end;