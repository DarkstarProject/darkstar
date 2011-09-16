-----------------------------------------
--	ID: 13435
--	Equip: Mercenary's Earring
--  Latent effect: VIT +2
--	Active while Warrior is set as your Support Job
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevsjob)

sjob = target:getSubJob();

earring1 = target:getEquipID(11);
earring2 = target:getEquipID(12);

	if ((earring1 == 13435 or earring2 == 13435)) then
		if (sjob == 1) then
			target:addMod(MOD_VIT, 2);
		elseif (prevsjob == 1) then
			target:delMod(MOD_VIT, 2);
		end
	elseif ((earring1 ~= 13435 and earring2 ~= 13435) and sjob == 1) then
		target:delMod(MOD_VIT, 2);
	end
end;