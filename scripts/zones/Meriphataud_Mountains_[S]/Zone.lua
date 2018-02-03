-----------------------------------
--
-- Zone: Meriphataud_Mountains_[S] (97)
--
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Meriphataud_Mountains_[S]/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-454.135,28.409,657.79,49);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onGameHour(zone)
    local GameHour = 150; -- Seconds per VanadielHour
    local npc = GetNPCByID(17175342); -- Indescript Markings
    if (npc ~= nil) then
        if (VanadielHour() == 17) then
            npc:setStatus(STATUS_DISAPPEAR);
        end
        if (VanadielHour() == 7) then
            npc:setStatus(STATUS_NORMAL);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;