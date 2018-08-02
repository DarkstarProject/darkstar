-----------------------------------
-- Area: Temenos
--  NPC: Temenos_Aern
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
mixins = 
{ 
    require("scripts/mixins/families/aern"),
    require("scripts/mixins/job_special")
}
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
        [16929054] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+197):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+197):setStatus(dsp.status.NORMAL);
        end,
        [16929060] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+199):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+199):setStatus(dsp.status.NORMAL);
        end,
        [16929065] = function (x)
            GetNPCByID(TEMENOS_BASE_CRATE+200):setPos(mobX,mobY,mobZ);
            GetNPCByID(TEMENOS_BASE_CRATE+200):setStatus(dsp.status.NORMAL);
        end,
        [16929075] = function (x)
             GetNPCByID(TEMENOS_BASE_CRATE+201):setPos(mobX,mobY,mobZ);
             GetNPCByID(TEMENOS_BASE_CRATE+201):setStatus(dsp.status.NORMAL);
        end,
    }
    local leftAern=0;

    local AernList = {16929053,16929054,16929055,16929057,16929058,16929060,16929061,16929062,16929063,
                  16929064,16929065,16929066,16929069,16929071,16929072,16929073,16929075,16929076,
                  16929077,16929078,16929079,16929082,16929083,16929084,16929085,16929086,16929087};

    for n=1,27,1 do
        if (IsMobDead(AernList[n]) == false) then
            leftAern=leftAern+1;
        end
    end
    --print("leftAern" ..leftAern);
    if (leftAern == 0 and isKiller == true) then
        GetMobByID(16929088):setSpawn(mobX,mobY,mobZ);
        SpawnMob(16929088):updateEnmity(player);
    end
end;
