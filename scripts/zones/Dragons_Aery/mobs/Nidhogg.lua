-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
	SetServerVariable("Nidhogg_Engaged", os.time(t));
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

	-- Regain
	mob:addTP(15);

	-- Auto-regen
	if (mob:getHP() < mob:getMaxHP()) then
		mob:addHP(50);
	end

	if (mob:getBattleTime() % 60 == 0) then -- Check every minute to reduce load
		if(os.time(t) >= (GetServerVariable("Nidhogg_Engaged") + 3600)) then
			mob:rageMode(); -- Stats = Stats * 10
		end
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(NIDHOGG_SLAYER);
  
  -- Set Nidhogg's Window Open Time
  wait = 72 * 3600
  SetServerVariable("[POP]Nidhogg", os.time(t) + wait); -- 3 days
  
  -- Set Fafnir's spawnpoint and respawn time (21-24 hours)
  SetServerVariable("[PH]Nidhogg", 0);
  DeterMob(17408018, false);
  UpdateNMSpawnPoint(17408018);
  SpawnMob(17408018, '', math.random((75600),(86400)));
  
end;