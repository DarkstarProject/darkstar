-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)

end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
	Behemoth_Engaged = os.time(t);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

	if (mob:getBattleTime() % 60 == 0) then -- Check every minute to reduce load
		if(os.time(t) >= (Behemoth_Engaged + 1800)) then
			mob:rageMode(); -- Stats = Stats * 10
		end
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(BEHEMOTHS_BANE);

    Behemoth      = mob:getID();
    King_Behemoth = 17297441;
    ToD     = GetServerVariable("[POP]King_Behemoth");
    kills   = GetServerVariable("[PH]King_Behemoth");
    DeterMob(Behemoth, true);
    if (ToD <= os.time(t) and GetMobAction(King_Behemoth) == 0) then
        if (math.random((1),(5)) == 3 or kills > 6) then
            UpdateNMSpawnPoint(King_Behemoth);
            SpawnMob(King_Behemoth, "", math.random((75600),(86400)));
        end
    else
        UpdateNMSpawnPoint(Behemoth);
        SpawnMob(Behemoth, '', math.random((75600),(86400)));
        SetServerVariable("[PH]King_Behemoth", kills + 1);
    end

end;