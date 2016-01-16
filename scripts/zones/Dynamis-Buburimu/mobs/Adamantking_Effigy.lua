-----------------------------------
-- Area: Dynamis Buburimu
--  MOB: Adamantking_Effigy

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
    dynamis.spawnGroup(mob, BuburimuQuadavList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    
    local mobID = mob:getID();
    
    if (mobID ==16941457) then --mp
        ally:messageBasic(025,(ally:getMaxMP()-ally:getMP()));
        ally:restoreMP(3000);        
    end
end;
