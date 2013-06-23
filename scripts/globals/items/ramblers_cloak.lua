-----------------------------------------
--	ID: 11312
--	Equip: Ramblers Cloak
--  Latent effect: STR +5
--	Active when TP >= 100%, should not active during weapon skills
-- Note: Script is not working 100%, there is no check on equipment after it has been equiped or unequiped.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)

	local TP = target:getTP();
	local body = target:getEquipID(SLOT_BODY);

	if(body == 11312) then
		if (TP >= 100) then
			target:addMod(MOD_STR, 5);
		elseif (TP < 100) then
			target:delMod(MOD_STR);
		end
	elseif (body ~= 11312 and TP >= 100) then
		target:delMod(MOD_STR, 5);
	end
end;