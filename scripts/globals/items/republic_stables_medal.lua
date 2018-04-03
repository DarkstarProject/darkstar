-----------------------------------------
-- ID: 13180
-- Item: Republic Stables Medal
-- Teleports to Chocobo Stables (Bastok)
-----------------------------------------
require("scripts/globals/teleports");
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:isZoneVisited(234) then
        result = 56
    end
    return result
end;

function onItemUse(target)
    republicStablesMedal(target)
end;