----------------------------------	
-- Area: Gustav Tunnel
--   NM: Baobhan Sith
-----------------------------------	

require("scripts/globals/titles");
require("/scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MATT,20);
	mob:addMod(MOD_MACC,400);
	
end;	
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
    local MobHP = mob:getHPP();
	if (MobHP < 75) then
		mob:addStatusEffect(EFFECT_HASTE,1,0,6000);
	end
end

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

	killer:addTitle(GHOSTIE_BUSTER);
  
    -- Set Baobhan Sith's Window Open Time
    local wait = math.random((4),(8)) * 3600
    SetServerVariable("[POP]Baobhan_Sith", os.time(t) + wait); -- 4-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Baobhan_Sith");
    SetServerVariable("[PH]Baobhan_Sith", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
  
end;