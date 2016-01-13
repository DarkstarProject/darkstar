-----------------------------------
-- Area: Dynamis Buburimu
-- MOB: Goblin Replica

-----------------------------------

require("scripts/globals/dynamis");
local text = require("scripts/zones/Dynamis-Buburimu/TextIDs");

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
    dynamis.spawnGroup(mob, BuburimuGoblinList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    
    local mobID = mob:getID();
    

    if ( mobID == 16941383 or mobID == 16941395) then --hp
        ally:messageBasic(024,(ally:getMaxHP()-ally:getHP()));
        ally:restoreHP(3000);
     elseif (mobID ==16941396 or mobID == 16941397) then --mp
        ally:messageBasic(025,(ally:getMaxMP()-ally:getMP()));
        ally:restoreMP(3000);        
    end
end;
