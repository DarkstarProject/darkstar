-----------------------------------
-- Area: Temenos E T
-- NPC: Earth_Elemental
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
    switch (mobID): caseof {
        -- 100 a 106 inclut (Temenos -Northern Tower )
        [16928867] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+182):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+182):setStatus(dsp.status.NORMAL);
        end    ,
        [16928868] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+236):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+236):setStatus(dsp.status.NORMAL);
        end    ,
        [16928869] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+360):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+360):setStatus(dsp.status.NORMAL);
        end    ,
        [16928870] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+47):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+47):setStatus(dsp.status.NORMAL);
        end    ,
        [16929036] = function (x)
            if (IsMobDead(16929037)==false) then --thunder ele
                DespawnMob(16929037);
                SpawnMob(16929043); --ramuh
            end
        end    ,
     }
end;