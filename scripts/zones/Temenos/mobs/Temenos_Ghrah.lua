-----------------------------------
-- Area: Temenos
--  NPC: Temenos_Ghrah
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();    
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(TEMENOS_BASE_CRATE+202):setPos(mobX,mobY,mobZ);
    GetNPCByID(TEMENOS_BASE_CRATE+202):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928770+476):setStatus(dsp.status.NORMAL);
end;
