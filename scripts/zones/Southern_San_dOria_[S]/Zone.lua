-----------------------------------
--
-- Zone: Southern_San_dOria_[S] (80)
--
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (prevZone == 81) then
        if (player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_ACCEPTED and player:getVar("KnotQuiteThere") == 2) then
            cs = 62;
        elseif (player:getQuestStatus(CRYSTAL_WAR, DOWNWARD_HELIX) == QUEST_ACCEPTED and player:getVar("DownwardHelix") == 0) then
            cs = 65;
        elseif (player:getCurrentMission(WOTG) == CAIT_SITH and
               (player:getQuestStatus(CRYSTAL_WAR, WRATH_OF_THE_GRIFFON) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, A_MANIFEST_PROBLEM) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, BURDEN_OF_SUSPICION) == QUEST_COMPLETED)) then
            cs = 67;
        end
    end
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(161,-2,161,94);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 0x7534;
        end
        player:setVar("PlayerMainJob",0);
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
    if (csid == 62) then
        player:setVar("KnotQuiteThere",3);
    elseif (csid == 65) then
        player:setVar("DownwardHelix",1);
    elseif (csid == 67) then
        player:completeMission(WOTG, CAIT_SITH);
        player:addMission(WOTG, THE_QUEEN_OF_THE_DANCE);
    end
end;