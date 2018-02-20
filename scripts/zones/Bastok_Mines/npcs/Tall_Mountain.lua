-----------------------------------
-- Area: Bastok Mines
--  NPC: Tall Mountain
-- Involved in Quest: Stamp Hunt
-- Finish Mission: Bastok 6-1
-- !pos 71 7 -7 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);

    if (player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 3) then
        player:startEvent(182);
    elseif (StampHunt == QUEST_ACCEPTED and player:getMaskBit(player:getVar("StampHunt_Mask"),1) == false) then
        player:startEvent(85);
    else
        player:startEvent(55);
    end

end;

-- 0x7fb5  55  85  0x00b0  0x00b4  182  0x024f  0x0251

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 182) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 85) then
        player:setMaskBit(player:getVar("StampHunt_Mask"),"StampHunt_Mask",1,true);
    end

end;
