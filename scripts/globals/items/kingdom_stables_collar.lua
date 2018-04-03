-----------------------------------------
-- ID: 13179
-- Item: Kingdom Stables Collar
-- Teleports to Chocobo Stables (San d'Oria)
-----------------------------------------
require("scripts/globals/teleports");
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:isZoneVisited(230) then
        result = 56
    end
    return result
end;

function onItemUse(target)
    kingdomStablesCollar(target)
end;