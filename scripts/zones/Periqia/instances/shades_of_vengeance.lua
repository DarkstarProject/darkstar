-----------------------------------
--
-- TOAU-31: Shades of Vengeance
--
-----------------------------------
package.loaded["scripts/zones/Periqia/IDs"] = nil;
-----------------------------------
require("scripts/zones/Periqia/IDs");
require("scripts/globals/instance")
require("scripts/globals/keyitems");
require("scripts/globals/missions")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(Periqia.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;

function onInstanceCreated(instance)
    for i,v in pairs(Periqia.mobs[79]) do
        SpawnMob(v, instance);
    end
end;

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, Periqia.text)
end;

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Periqia.text.MISSION_FAILED,10,10);
        v:startEvent(102);
    end
end;

function onInstanceProgressUpdate(instance, progress)

    if (progress >= 10 and instance:completed() == false) then
        instance:complete();
    end

end;

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        if (v:getCurrentMission(TOAU) == SHADES_OF_VENGEANCE) then
            v:setVar("AhtUrganStatus",1);
        end

        v:startEvent(102);
    end

end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
