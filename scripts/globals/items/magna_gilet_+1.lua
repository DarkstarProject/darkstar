-----------------------------------------
-- ID: 11275
-- Item: magna gilet +1
-- Teleport's user to Purgonorgo Isle
-----------------------------------------

require("scripts/globals/teleports");

function onItemCheck(target)
--	need to add a check to see if player has been in Bibiki Bay at least once
return 0;
end;

function onItemUse(target)
	toPurgonorgo(target);
end;