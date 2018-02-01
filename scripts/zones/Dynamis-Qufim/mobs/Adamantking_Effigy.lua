-----------------------------------
-- Area: Dynamis Qufim
--  NPC: Adamantking_Effigy

-----------------------------------
package.loaded["scripts/zones/Dynamis-Qufim/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Qufim/TextIDs");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, QufimQuadavList);
end;

function onMobDeath(mob, player, isKiller)

    -- local mobID = mob:getID();


end;
