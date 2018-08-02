-----------------------------------
-- Area: Temenos E T
-- NPC: Fire_Elemental
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
        [16928840] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+173):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+173):setStatus(dsp.status.NORMAL);
        end    ,
        [16928841] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+215):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+215):setStatus(dsp.status.NORMAL);
        end    ,
        [16928842] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+284):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+284):setStatus(dsp.status.NORMAL);
        end    ,
        [16928843] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+40):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+40):setStatus(dsp.status.NORMAL);
        end    ,
        [16929033] = function (x)
            if (IsMobDead(16929034)==false) then -- ice ele
                DespawnMob(16929034);
                SpawnMob(16929040); --shiva
            end
        end    ,
     }
end;