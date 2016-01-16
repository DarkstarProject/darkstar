-----------------------------------
-- Area: Dynamis Buburimu
--  MOB: Serjeant_Tombstone

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

function onMobDeath(mob,killer,ally)
    local mobID = mob:getID();

    if ( mobID == 16941135 or mobID == 16941411) then --hp
        ally:messageBasic(024,(ally:getMaxHP()-ally:getHP()));
        ally:restoreHP(3000);
     elseif (mobID == 16941137 or mobID == 16941412) then --mp
        ally:messageBasic(025,(ally:getMaxMP()-ally:getMP()));
        ally:restoreMP(3000);        
    end
end;
