-----------------------------------
-- Area: Attohwa Chasm
-- NPC:  Xolotl
-----------------------------------
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(XOLOTL_XTRAPOLATOR);	
	-- Do not respawn Xolotl for 21-24 hours
	mob:setRespawnTime(math.random((75600),(86400)));

end;