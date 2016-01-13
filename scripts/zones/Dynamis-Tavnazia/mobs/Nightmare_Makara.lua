-----------------------------------
-- Area: Dynamis Tavnazia
--  NPC: Nightmare_Makara

-----------------------------------

require("scripts/globals/dynamis");
local text = require("scripts/zones/Dynamis-Tavnazia/TextIDs");

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
    dynamis.spawnGroup(mob, TavnaziaCloneList, 4);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    
end;
