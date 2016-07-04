-----------------------------------
-- Area: Dynamis Valkurm
-- NPC:  Serjeant_Tombstone

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
    dynamis.spawnGroup(mob, ValkurmOrcishList);
end;


                     
                    



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
--    local mobID = mob:getID();
    
end;
