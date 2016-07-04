-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Adamantking_Effigy
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
    dynamis.spawnGroup(mob, ValkurmQuadavList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    local mobID = mob:getID();
    
    if ( mobID == 16937233) then --hp
        player:messageBasic(024,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
    end
end;
