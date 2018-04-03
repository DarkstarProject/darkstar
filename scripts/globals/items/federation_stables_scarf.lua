-----------------------------------------
-- ID: 13181
-- Item: Federation Stables Scarf
-- Teleports to Chocobo Stables (Windurst)
-----------------------------------------
require("scripts/globals/teleports");
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:isZoneVisited(241) then
        result = 56
    end
    return result
end;

function onItemUse(target)
    federationStablesScarf(target)
end;