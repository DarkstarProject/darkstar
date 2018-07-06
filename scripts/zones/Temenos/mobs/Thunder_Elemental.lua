-----------------------------------
-- Area: Temenos E T
-- NPC: Thunder_Elemental
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
        [16928876] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+183):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+183):setStatus(dsp.status.NORMAL);
        end    ,
        [16928877] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+261):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+261):setStatus(dsp.status.NORMAL);
        end    ,
        [16928878] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+393):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+393):setStatus(dsp.status.NORMAL);
        end    ,
        [16928879] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+68):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+68):setStatus(dsp.status.NORMAL);
        end    ,
        [16929037] = function (x)
            if (IsMobDead(16929038)==false) then --water ele
                DespawnMob(16929038);
                SpawnMob(16929044); --leviathan
            end
        end    ,
    }
end;