-----------------------------------
-- Area: Dynamis qufim
-- NPC:  Goblin Replica

-----------------------------------
package.loaded["scripts/zones/Dynamis-Qufim/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Qufim/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, QufimGoblinList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	local mobID = mob:getID();
	

	if ( mobID == 16945528 or mobID == 16945538 or mobID == 16945546 ) then --hp
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	    killer:restoreHP(3000);
     elseif (mobID == 16945529 or mobID == 16945545) then --mp
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
		killer:restoreMP(3000);		
	end
end;
