-----------------------------------------
--	ID: 14656
--	Poseidon's Ring
--  	This earring functions in the same way as the spell Water Spirit.
--	Uses: 50
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:spawnPet(PET_WATER_SPIRIT);
end;
