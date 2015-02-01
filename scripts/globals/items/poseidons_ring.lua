-----------------------------------------
--	ID: 14656
--	Item: Poseidon's Ring
--	Description: This ring functions in
--	the same way as the spell Water
--	Spirit.
--	Uses: 50
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getPet() ~= nil) then
		return MSGBASIC_ALREADY_HAS_A_PET;
	else
		return 0;
	end
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:spawnPet(PET_WATER_SPIRIT);
end;