-----------------------------------------
--  ID: 16793
--	Equip: Scythe of Trials
--  Latent effect is active while less then 300 weapon skills have been preformed on EP+ Mobs using this weapon.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevsjob)

	mainEquip = target:getEquipID(SLOT_MAIN);

	if (mainEquip == 16793) then
		if (target:getVar("WSNMHits") < 300) then
			target:addMod(MOD_HP, 20);
			target:addMod(MOD_THUNDERDEF, 10);
			target:addMod(MOD_LIGHTDEF, 10);
		else
			target:delMod(MOD_HP, 20);
			target:delMod(MOD_THUNDERDEF, 10);
			target:delMod(MOD_LIGHTDEF, 10);
		end
	end
	
end;