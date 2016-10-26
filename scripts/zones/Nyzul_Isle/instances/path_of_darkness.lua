-----------------------------------
--
-- TOAU-42: Path of Darkness
--
-----------------------------------

require("scripts/globals/instance")
require("scripts/globals/keyitems");
require("scripts/zones/Nyzul_Isle/IDs");

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(NyzulIsle.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(instance)
    SpawnMob(NyzulIsle.mobs[58].AMNAF_BLU, instance);

    local naja = instance:insertAlly(2608);
    naja:setSpawn(503.107,-0.23,-545.704,111);
    naja:spawn();
end;

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, NyzulIsle.text)
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(instance)
    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:setPos(0,0,0,0,72);
    end
end;

-----------------------------------
-- onInstanceProgressUpdate
-----------------------------------

function onInstanceProgressUpdate(instance, progress)
    if(progress >= 10 and progress < 20) then
        DespawnMob(NyzulIsle.mobs[58].AMNAF_BLU, instance);
    elseif(progress == 24) then
        local allies = instance:getAllies();
        for i,v in pairs(allies) do
            v:setLocalVar("ready",0);
            v:setLocalVar("Stage",2);
        end

        SpawnMob(NyzulIsle.mobs[58].AMNAF_BLU, instance);
    elseif(progress >= 30 and progress < 40) then
        DespawnMob(NyzulIsle.mobs[58].AMNAF_BLU, instance);
    elseif(progress == 48) then
        SpawnMob(NyzulIsle.mobs[58].AMNAF_PSYCHEFLAYER, instance);

        local allies = instance:getAllies();
        for i,v in pairs(allies) do
            v:setLocalVar("ready",0);
            v:setLocalVar("Stage",3);
        end

        local npcs = instance:getNpcs();

        for i,v in pairs(npcs) do
            if(v:getID() == NyzulIsle.npcs._259) then
                v:setAnimation(8);
            end
        end
    elseif(progress == 50) then
        instance:complete();
    end
end;

-----------------------------------
-- onInstanceComplete
-----------------------------------

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        if (v:getCurrentMission(TOAU) == PATH_OF_DARKNESS and v:getVar("AhtUrganStatus") == 1) then
            v:setVar("AhtUrganStatus", 2);
        end

        v:setPos(0,0,0,0,72);
    end
end;
