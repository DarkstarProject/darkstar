-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel's Wyvern
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

	local mobid = mob:getID()

	if (mobid == 17514518) then
		GetMobByID(17514497):updateEnmity(target); -- Hume
		GetMobByID(17514500):updateEnmity(target); -- Mithra
		GetMobByID(17514503):updateEnmity(target); -- Tiger
		GetMobByID(17514509):updateEnmity(target); -- Elvaan
		GetMobByID(17514512):updateEnmity(target); -- Tarutaru
		GetMobByID(17514515):updateEnmity(target); -- Galka
		return;

	elseif (mobid == 17514519) then
		GetMobByID(17514498):updateEnmity(target);
		GetMobByID(17514501):updateEnmity(target);
		GetMobByID(17514504):updateEnmity(target);
		GetMobByID(17514510):updateEnmity(target);
		GetMobByID(17514513):updateEnmity(target);
		GetMobByID(17514516):updateEnmity(target);
		return;


	elseif (mobid == 17514520) then
		GetMobByID(17514499):updateEnmity(target);
		GetMobByID(17514502):updateEnmity(target);
		GetMobByID(17514505):updateEnmity(target);
		GetMobByID(17514511):updateEnmity(target);
		GetMobByID(17514514):updateEnmity(target);
		GetMobByID(17514516):updateEnmity(target);
		return;

	end


end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
