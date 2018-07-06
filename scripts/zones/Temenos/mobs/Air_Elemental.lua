-----------------------------------
-- Area: Temenos E T
-- NPC: Air_Elemental
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
        [16928858] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+181):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+181):setStatus(dsp.status.NORMAL);
        end    ,
        [16928859] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+217):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+217):setStatus(dsp.status.NORMAL);
        end    ,
        [16928860] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+348):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+348):setStatus(dsp.status.NORMAL);
        end    ,
        [16928861] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+46):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+46):setStatus(dsp.status.NORMAL);
        end    ,
        [16929035] = function (x)
            if (IsMobDead(16929036)==false) then --earth ele
                DespawnMob(16929036);
                SpawnMob(16929042); --titan
            end
        end    ,
     }
end;