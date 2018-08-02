-----------------------------------
-- Area: Temenos W T
--  NPC: Enhanced_Mandragora
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
    local cofferID=Randomcoffer(2,GetInstanceRegion(1298));
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16929236):setStatus(dsp.status.NORMAL);
    if (cofferID~=0) then
        GetNPCByID(TEMENOS_BASE_CRATE+cofferID):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+cofferID):setStatus(dsp.status.NORMAL);
    end
end;
