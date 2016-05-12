-----------------------------------
-- Area: Dynamis Tavnazia
-- NPC:  Nightmare_Leech

-----------------------------------
package.loaded["scripts/zones/Dynamis-Tavnazia/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Tavnazia/TextIDs");

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
    dynamis.spawnGroup(mob, TavnaziaCloneList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
end;
