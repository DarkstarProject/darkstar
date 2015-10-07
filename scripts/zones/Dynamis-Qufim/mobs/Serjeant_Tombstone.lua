-----------------------------------
-- Area: Dynamis-Qufim
-- NPC:  Serjeant_Tombstone

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
    dynamis.spawnGroup(mob, QufimOrcishList);
end;


                     
					



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	--local mobID = mob:getID();
end;
