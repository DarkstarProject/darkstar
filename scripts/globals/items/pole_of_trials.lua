-----------------------------------------
--  ID: 17527
--	Equip: Pole of Trials
--  Latent effect is active while less then 300 weapon skills have been preformed on EP+ Mobs using this weapon.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevsjob)

	mainEquip = target:getEquipID(SLOT_MAIN);

	if (mainEquip == 17527) then
		if (target:getVar("WSNMHits") < 300) then
			target:addMod(MOD_HP, 10);
			target:addMod(MOD_MP, 10);
			target:addMod(MOD_FIREDEF, 10);
			target:addMod(MOD_LIGHTDEF, 10);
		else
			target:delMod(MOD_HP, 10);
			target:delMod(MOD_MP, 10);
			target:delMod(MOD_FIREDEF, 10);
			target:delMod(MOD_LIGHTDEF, 10);
		end
	end
	
end;