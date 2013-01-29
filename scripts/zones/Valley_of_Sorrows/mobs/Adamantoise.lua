-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  Adamantoise
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- OnMobInitialise Action
-----------------------------------

function onMobInitialize(mob)
	mob:addStatusEffect(EFFECT_REGAIN,15,3,0);
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
	killer:addTitle(TORTOISE_TORTURER);
	
  Adamantoise  = mob:getID();
  Aspidochelone = 17408019; 
  ToD     = GetServerVariable("[POP]Aspidochelone");
  kills   = GetServerVariable("[PH]Aspidochelone");
  if (ToD <= os.time(t) and GetMobAction(Aspidochelone) == 0) then
    if (math.random((1),(5)) == 3 or kills > 6) then
      UpdateNMSpawnPoint(Aspidochelone);
      SpawnMob(Aspidochelone, "", math.random((75600),(86400)));
      DeterMob(Adamantoise, true);
    end
  else
    UpdateNMSpawnPoint(Adamantoise);
    SpawnMob(Adamantoise, '', math.random((75600),(86400)));
    SetServerVariable("[PH]Aspidochelone", kills + 1);
  end
end;