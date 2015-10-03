-----------------------------------
-- Area: Dynamis Buburimu
-- NPC:  Manifest_Icon
-----------------------------------
package.loaded["scripts/zones/Dynamis-Buburimu/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Buburimu/TextIDs");
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
    dynamis.spawnGroup(mob, BuburimuYagudoList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	--local mobID = mob:getID();
		local mobID = mob:getID();

	if ( mobID == 16941208 or mobID == 16941485) then --hp
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	    killer:restoreHP(3000);
     elseif (mobID == 16941190 or mobID == 16941192 or 16941486) then --mp
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
		killer:restoreMP(3000);		
	end
	
	
end;
