-----------------------------------
--
-- Zone: Aydeewa_Subterrane (68)
--
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/zones/Aydeewa_Subterrane/TextIDs");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,378,-3,338,382,3,342);
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(356.503,-0.364,-179.607,122);
    end

    if (player:getCurrentMission(TOAU) == TEAHOUSE_TUMULT and player:getVar("AhtUrganStatus") == 0) then
        cs = 10;
    end

    return cs;
end;

function onRegionEnter(player,region)
    if (region:GetRegionID() == 1) then
        local StoneID = player:getVar("EmptyVesselStone");
        if (player:getQuestStatus(AHT_URHGAN,AN_EMPTY_VESSEL) == 1 and player:getVar("AnEmptyVesselProgress") == 4 and player:hasItem(StoneID) == true) then
            player:startEvent(3,StoneID);
        end;
    end;
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 3 and option == 13) then -- Accept and unlock
        player:setVar("AnEmptyVesselProgress",0);
        player:setVar("EmptyVesselStone",0);
        player:addKeyItem(MARK_OF_ZAHAK);
        player:unlockJob(JOBS.BLU);
        player:addTitle(BEARER_OF_THE_MARK_OF_ZAHAK);
        player:completeQuest(AHT_URHGAN,AN_EMPTY_VESSEL);
        player:setPos(148,-2,0,130,50);
    elseif (csid == 3 and option ~= 13) then -- Make a mistake and get reset
        player:setVar("AnEmptyVesselProgress",0);
        player:setVar("EmptyVesselStone",0);
        player:delQuest(AHT_URHGAN,AN_EMPTY_VESSEL);
        player:setPos(148,-2,0,130,50);
    elseif (csid == 10) then
        player:setVar("AhtUrganStatus", 1);
    end;
end;
