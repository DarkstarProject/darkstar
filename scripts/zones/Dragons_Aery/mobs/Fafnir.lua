-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
	SetServerVariable("Fafnir_Engaged", os.time(t));
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

	mob:addTP(15); -- Regain

	if (mob:getBattleTime() % 60 == 0) then -- Check every minute to reduce load
		if(os.time(t) >= (GetServerVariable("Fafnir_Engaged") + 3600)) then
			mob:rageMode(); -- Stats = Stats * 10
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(FAFNIR_SLAYER);

	Fafnir  = mob:getID();
	Nidhogg = 17408019; 
	ToD     = GetServerVariable("[POP]Nidhogg");
	kills   = GetServerVariable("[PH]Nidhogg");
	if (ToD <= os.time(t) and GetMobAction(Nidhogg) == 0) then
		if (math.random((1),(5)) == 3 or kills > 6) then
			UpdateNMSpawnPoint(Nidhogg);
			SpawnMob(Nidhogg, "", math.random((75600),(86400)));
			DeterMob(Fafnir, true);
		end
	else
		UpdateNMSpawnPoint(Fafnir);
		SpawnMob(Fafnir, '', math.random((75600),(86400)));
		SetServerVariable("[PH]Nidhogg", kills + 1);
	end
  
end;