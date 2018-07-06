-----------------------------------
-- Area: Temenos E T
-- NPC: Water_Elemental
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
        [16928885] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+277):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+277):setStatus(dsp.status.NORMAL);
        end    ,
        [16928886] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+190):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+190):setStatus(dsp.status.NORMAL);
        end    ,
        [16928887] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+127):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+127):setStatus(dsp.status.NORMAL);
        end    ,
        [16928888] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+69):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+69):setStatus(dsp.status.NORMAL);
        end    ,
        [16929038] = function (x)
            if (IsMobDead(16929033)==false) then --fire ele
                DespawnMob(16929033);
                SpawnMob(16929039); --ifrit prime
            end
        end    ,
     }
end;