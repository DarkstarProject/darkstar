-----------------------------------------
-- ID: 11278
-- Item: wonder top +1
-- Teleport's user to Purgonorgo Isle
-----------------------------------------

package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

function onItemCheck(target)
--	need to add a check to see if player has been in Bibiki Bay at least once
return 0;
end;

function onItemUse(target)
	TidalTalisman(target, target:getZone());
end;