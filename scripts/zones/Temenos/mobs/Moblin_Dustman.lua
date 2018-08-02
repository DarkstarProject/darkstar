-----------------------------------
-- Area: Temenos N T
--  NPC: Moblin_Dustman
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    -- print(mobID);
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    if (mobID ==16928775) then
        GetNPCByID(TEMENOS_BASE_CRATE+152):setPos(328,70,464);
        GetNPCByID(TEMENOS_BASE_CRATE+152):setStatus(dsp.status.NORMAL);
    elseif (mobID ==16928777) then
        GetNPCByID(TEMENOS_BASE_CRATE+209):setPos(332,70,470);
        GetNPCByID(TEMENOS_BASE_CRATE+209):setStatus(dsp.status.NORMAL);
    end
end;