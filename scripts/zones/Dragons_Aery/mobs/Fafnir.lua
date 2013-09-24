-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
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
    DeterMob(Fafnir, true);
	if (ToD <= os.time(t) and GetMobAction(Nidhogg) == 0) then
		if (math.random((1),(5)) == 3 or kills > 6) then
			UpdateNMSpawnPoint(Nidhogg);
            GetMobByID(Nidhogg):setRespawnTime(math.random((75600),(86400)));
		end
	else
		UpdateNMSpawnPoint(Fafnir);
        mob:setRespawnTime(math.random((75600),(86400)));
		SetServerVariable("[PH]Nidhogg", kills + 1);
	end

end;