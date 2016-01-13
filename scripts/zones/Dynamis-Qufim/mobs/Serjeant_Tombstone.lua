-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: Serjeant_Tombstone

-----------------------------------

require("scripts/globals/dynamis");
local text = require("scripts/zones/Dynamis-Qufim/TextIDs");

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

function onMobDeath(mob,killer,ally)
    --local mobID = mob:getID();
end;
