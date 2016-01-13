-----------------------------------
-- Area: Dynamis Valkurm
--  NPC: Manifest_Icon
-----------------------------------

require("scripts/globals/dynamis");
local text = require("scripts/zones/Dynamis-Valkurm/TextIDs");

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
    dynamis.spawnGroup(mob, ValkurmYagudoList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    
    --local mobID = mob:getID();
    
    
    
end;
