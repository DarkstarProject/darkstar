-----------------------------------
--
-- Zone: Nyzul_Isle
--
-----------------------------------
package.loaded["scripts/zones/Nyzul_Isle/IDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/zones/Nyzul_Isle/IDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (player:getCurrentMission(TOAU) == PATH_OF_DARKNESS) then
            cs = 51;
        end
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if(csid == 1) then
        player:setPos(0,0,0,0,72);
    end
end;

