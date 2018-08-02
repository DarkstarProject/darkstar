-----------------------------------
-- Area: Temenos E T
-- NPC: Light_Elemental
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
    local mobID = mob:getID();
    if (mobID==16929031) then
        GetMobByID(16929032):updateEnmity(target);
        GetMobByID(16929030):updateEnmity(target);
    elseif (mobID==16929032) then
        GetMobByID(16929031):updateEnmity(target);
        GetMobByID(16929030):updateEnmity(target);
    end
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    
    switch (mobID): caseof {
        [16929031] = function (x)
            if (GetMobByID(16929030):isDead() and GetMobByID(16929032):isDead()) then
                GetNPCByID(TEMENOS_BASE_CRATE+77):setPos(0.5,-6,-459);
                GetNPCByID(TEMENOS_BASE_CRATE+77):setStatus(dsp.status.NORMAL);
                GetNPCByID(16928770+473):setStatus(dsp.status.NORMAL);
            end
        end    ,
        [16929032] = function (x)
            if (GetMobByID(16929030):isDead() and GetMobByID(16929031):isDead()) then
                GetNPCByID(TEMENOS_BASE_CRATE+77):setPos(0.5,-6,-459);
                GetNPCByID(TEMENOS_BASE_CRATE+77):setStatus(dsp.status.NORMAL);
                GetNPCByID(16928770+473):setStatus(dsp.status.NORMAL);
            end
        end    ,
     }
end;