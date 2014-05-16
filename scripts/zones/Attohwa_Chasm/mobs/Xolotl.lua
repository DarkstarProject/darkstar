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
	-- Do not respawn Xolotl for 24 hours
	-- DeterMob is disabled in globals/automatisation.lua at midnight, if timer is up.
	DeterMob(mob:getID(), true);
	SetServerVariable("[POP]Xolotl", os.time(t) + 86400);

end;