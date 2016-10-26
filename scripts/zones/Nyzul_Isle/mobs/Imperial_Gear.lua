-----------------------------------
-- Area: Nyzul Isle (Path of Darkness)
--  MOB: Imperial Gear
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Nyzul_Isle/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local instance = mob:getInstance();
    local progress = instance:getProgress();

    if(progress >= 24) then
        local mobs = instance:getMobs();

        for i,v in pairs(mobs) do
            if(v:getID() == NyzulIsle.mobs[58].AMNAF_BLU) then
                local pos = v:getPos();

                if(mob:getID() == NyzulIsle.mobs[58].IMPERIAL_GEAR1) then
                    mob:setPos(pos.x+2,pos.y,pos.z,pos.rot);
                elseif(mob:getID() == NyzulIsle.mobs[58].IMPERIAL_GEAR2) then
                    mob:setPos(pos.x,pos.y,pos.z+2,pos.rot);
                elseif(mob:getID() == NyzulIsle.mobs[58].IMPERIAL_GEAR3) then
                    mob:setPos(pos.x-2,pos.y,pos.z,pos.rot);
                elseif(mob:getID() == NyzulIsle.mobs[58].IMPERIAL_GEAR4) then
                    mob:setPos(pos.x,pos.y,pos.z-2,pos.rot);
                end
            end
        end
    end
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    local allies = mob:getInstance():getAllies();
    for i,v in pairs(allies) do
        v:setLocalVar("ready",1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
