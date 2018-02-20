-----------------------------------
-- Area: Metalworks
--  NPC: Malduc
-- Type: Mission Giver
-- !pos 66.200 -14.999 4.426 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local CurrentMission = player:getCurrentMission(BASTOK);
    local Count = trade:getItemCount();

    if (CurrentMission ~= 255) then
        if (CurrentMission == FETICHISM and player:hasCompletedMission(BASTOK,FETICHISM) == false and trade:hasItemQty(606,1) and trade:hasItemQty(607,1) and trade:hasItemQty(608,1) and trade:hasItemQty(609,1) and Count == 4) then
            player:startEvent(1008); -- Finish Mission "Fetichism" (First Time)
        elseif (CurrentMission == FETICHISM and trade:hasItemQty(606,1) and trade:hasItemQty(607,1) and trade:hasItemQty(608,1) and trade:hasItemQty(609,1) and Count == 4) then
            player:startEvent(1005); -- Finish Mission "Fetichism" (Repeat)
        elseif (CurrentMission == TO_THE_FORSAKEN_MINES and player:hasCompletedMission(BASTOK,TO_THE_FORSAKEN_MINES) == false and trade:hasItemQty(563,1) and Count == 1) then
            player:startEvent(1010); -- Finish Mission "To the forsaken mines" (First Time)
        elseif (CurrentMission == TO_THE_FORSAKEN_MINES and trade:hasItemQty(563,1) and Count == 1) then
            player:startEvent(1006); -- Finish Mission "To the forsaken mines" (Repeat)
        end
    end

end;

function onTrigger(player,npc)

    if (player:getNation() ~= NATION_BASTOK) then
        player:startEvent(1003); -- For non-Bastokian
    else
        local CurrentMission = player:getCurrentMission(BASTOK);
        local cs, p, offset = getMissionOffset(player,1,CurrentMission,player:getVar("MissionStatus"));

        if (cs ~= 0 or offset ~= 0 or ((CurrentMission == 0 or CurrentMission == 16) and offset == 0)) then
            if (CurrentMission <= 15 and cs == 0) then
                player:showText(npc,ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission (Rank 1~5)
            elseif (CurrentMission > 15 and cs == 0) then
                player:showText(npc,EXTENDED_MISSION_OFFSET + offset); -- dialog after accepting mission (Rank 6~10)
            else
                player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
            end
        elseif (player:getRank() == 1 and player:hasCompletedMission(BASTOK,THE_ZERUHN_REPORT) == false) then
            player:startEvent(1000); -- Start First Mission "The Zeruhn Report"
        elseif (CurrentMission ~= 255) then
            player:startEvent(1002); -- Have mission already activated
        else
             local flagMission, repeatMission = getMissionMask(player);
             player:startEvent(1001,flagMission,0,0,0,0,repeatMission); -- Mission List
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

    finishMissionTimeline(player,1,csid,option);

end;