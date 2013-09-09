-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
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
	KingBehemoth_Engaged = os.time(t);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

	if(mob:getBattleTime() == 3600) then
		mob:rageMode();
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(BEHEMOTH_DETHRONER);

    -- Set King_Behemoth's Window Open Time
    wait = 72 * 3600
    SetServerVariable("[POP]King_Behemoth", os.time(t) + wait); -- 3 days

    -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    SetServerVariable("[PH]King_Behemoth", 0);
    Behemoth = 17297440;
    DeterMob(Behemoth, false);
    UpdateNMSpawnPoint(Behemoth);
    GetMobByID(Behemoth):setRespawnTime(math.random((75600),(86400)));

end;