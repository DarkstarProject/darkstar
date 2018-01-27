-----------------------------------
-- Area: Dynamis Tavnazia
--  NPC: Nightmare_Hornet

-----------------------------------
package.loaded["scripts/zones/Dynamis-Tavnazia/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Tavnazia/TextIDs");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, TavnaziaCloneList);
end;

function onMobDeath(mob, player, isKiller)

end;
