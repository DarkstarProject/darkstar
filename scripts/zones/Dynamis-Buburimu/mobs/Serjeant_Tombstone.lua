-----------------------------------
-- Area: Dynamis Buburimu
-- NPC:  Serjeant_Tombstone

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
    dynamis.spawnGroup(mob, BuburimuOrcishList);
end;


                     
					



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	local mobID = mob:getID();

	if ( mobID == 16941135 or mobID == 16941411) then --hp
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	    killer:restoreHP(3000);
     elseif (mobID == 16941137 or mobID == 16941412) then --mp
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
		killer:restoreMP(3000);		
	end
end;
