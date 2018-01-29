-----------------------------------
--
-- Zone: East_Ronfaure_[S] (81)
--
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/East_Ronfaure_[S]/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(86.131,-65.817,273.861,25);
    end
    if (prevZone == 80) then
        if (player:getCurrentMission(WOTG) == WHILE_THE_CAT_IS_AWAY) then
            cs = 7;
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
    if (csid == 7) then
        player:completeMission(WOTG, WHILE_THE_CAT_IS_AWAY);
        player:addMission(WOTG, A_TIMESWEPT_BUTTERFLY);
    end
end;