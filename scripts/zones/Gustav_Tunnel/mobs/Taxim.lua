----------------------------------	
-- Area: Gustav Tunnel
--   NM: Taxim
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
	mob:addMod(MOD_MATT,40);
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
  
    -- Set Taxim's Window Open Time
    SetServerVariable("[POP]Taxim", os.time(t) + 7200); -- 2 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Taxim");
    SetServerVariable("[PH]Taxim", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;