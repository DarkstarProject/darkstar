-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:getBattleTime() == 1800) then
		mob:rageMode();
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
  if (ToD <= os.time(t) and GetMobAction(King_Behemoth) == 0) then
    if (math.random((1),(5)) == 3 or kills > 6) then
      UpdateNMSpawnPoint(King_Behemoth);
      SpawnMob(King_Behemoth, "", math.random((75600),(86400)));
      DeterMob(Behemoth, true);
    end
  else
    UpdateNMSpawnPoint(Behemoth);
    SpawnMob(Behemoth, '', math.random((75600),(86400)));
    SetServerVariable("[PH]King_Behemoth", kills + 1);
  end
  
end;