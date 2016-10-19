-----------------------------------
--
-- TOAU-15: The Black Coffin
--
-----------------------------------

require("scripts/globals/instance")
require("scripts/globals/keyitems");
local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(TheAshuTalif.text.FADES_INTO_NOTHINGNESS, EPHRAMADIAN_GOLD_COIN);
    player:delKeyItem(EPHRAMADIAN_GOLD_COIN);
    player:messageSpecial(TheAshuTalif.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(instance)
    for i,v in pairs(TheAshuTalif.mobs[1]) do
        SpawnMob(v, instance);
    end

    local gessho = instance:insertAlly(2022);
    gessho:setSpawn(0,-22.5, 22, 64);
    gessho:spawn();
end;

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, TheAshuTalif.text)
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(TheAshuTalif.text.MISSION_FAILED,10,10);
        v:startEvent(102);
    end
end;

-----------------------------------
-- onInstanceProgressUpdate
-----------------------------------

function onInstanceProgressUpdate(instance, progress)

    if (progress == 5) then
        local allies = instance:getAllies();
        for i,v in pairs(allies) do
            v:setLocalVar("ready",2);
        end

        for i,v in pairs(TheAshuTalif.mobs[2]) do
            SpawnMob(v, instance);
        end
    elseif (progress >= 10 and instance:completed() == false) then
        local allies = instance:getAllies();
        for i,v in pairs(allies) do
            v:setLocalVar("ready",4);
        end

        local chars = instance:getChars();

        for i,v in pairs(chars) do
            v:startEvent(102);
        end

        instance:complete();
    end

end;

-----------------------------------
-- onInstanceComplete
-----------------------------------

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        if (v:getCurrentMission(TOAU) == THE_BLACK_COFFIN and v:getVar("AhtUrganStatus") == 1) then
            v:setVar("AhtUrganStatus", 2);
        end
    end
end;

