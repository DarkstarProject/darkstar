-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel MR
--
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	mobid = mob:getID()

	if (mobid == 17514500) then
		GetMobByID(17514497):updateEnmity(target);
		GetMobByID(17514509):updateEnmity(target);
		GetMobByID(17514512):updateEnmity(target);
		GetMobByID(17514515):updateEnmity(target);
		GetMobByID(17514518):updateEnmity(target);
		GetMobByID(17514503):updateEnmity(target);
		return;

	elseif (mobid == 17514501) then
		GetMobByID(17514498):updateEnmity(target);
		GetMobByID(17514504):updateEnmity(target);
		GetMobByID(17514510):updateEnmity(target);
		GetMobByID(17514513):updateEnmity(target);
		GetMobByID(17514516):updateEnmity(target);
		GetMobByID(17514519):updateEnmity(target);
		return;


	elseif (mobid == 17514502) then
		GetMobByID(17514499):updateEnmity(target);
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
