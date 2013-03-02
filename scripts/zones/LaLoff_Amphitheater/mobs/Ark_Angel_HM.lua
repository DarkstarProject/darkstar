-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel HM
--
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	local mobid = mob:getID()

	if (mobid == 17514497) then
		GetMobByID(17514500):updateEnmity(target);
		GetMobByID(17514509):updateEnmity(target);
		GetMobByID(17514512):updateEnmity(target);
		GetMobByID(17514515):updateEnmity(target);
		GetMobByID(17514518):updateEnmity(target);
		GetMobByID(17514503):updateEnmity(target);
		return;


	elseif (mobid == 17514498) then
		GetMobByID(17514501):updateEnmity(target);
		GetMobByID(17514504):updateEnmity(target);
		GetMobByID(17514510):updateEnmity(target);
		GetMobByID(17514513):updateEnmity(target);
		GetMobByID(17514516):updateEnmity(target);
		GetMobByID(17514519):updateEnmity(target);
		return;


	elseif (mobid == 17514499) then
		GetMobByID(17514502):updateEnmity(target);
		GetMobByID(17514505):updateEnmity(target);
		GetMobByID(17514511):updateEnmity(target);
		GetMobByID(17514514):updateEnmity(target);
		GetMobByID(17514517):updateEnmity(target);
		GetMobByID(17514520):updateEnmity(target);
		return;

	end


end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
