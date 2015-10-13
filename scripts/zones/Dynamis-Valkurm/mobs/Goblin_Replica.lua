-----------------------------------
-- Area: Dynamis Valkurm
-- NPC:  Goblin Replica

-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Valkurm/TextIDs");

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
    dynamis.spawnGroup(mob, ValkurmGoblinList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	local mobID = mob:getID();
	if (mobID ==16937283) then --hp		
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	    killer:restoreHP(3000);
	elseif (mobID ==16937284) then --mp
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
		killer:restoreMP(3000);
	end
end;
