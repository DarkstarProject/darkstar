-----------------------------------------
-- ID: 11277
-- Item: wonder mailot +1
-- Teleport's user to Purgonorgo Isle
-----------------------------------------

require("scripts/globals/teleports");

function onItemCheck(target)
local result = 0;
    if (target:isZoneVisited(4) == false) then
        result = 56;
    end
return result;
end;

function onItemUse(target)
    toPurgonorgoBibiki(target);
end;