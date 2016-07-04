-----------------------------------
-- Area: Bastok Mines
-- NPC:  Tall Mountain
-- Involved in Quest: Stamp Hunt
-- Finish Mission: Bastok 6-1
-- @pos 71 7 -7 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);

    if (player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 3) then
        player:startEvent(0x00b6);
    elseif (StampHunt == QUEST_ACCEPTED and player:getMaskBit(player:getVar("StampHunt_Mask"),1) == false) then
        player:startEvent(0x0055);
    else
        player:startEvent(0x0037);
    end

end;

-- 0x7fb5  0x0037  0x0055  0x00b0  0x00b4  0x00b6  0x024f  0x0251

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00b6) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 0x0055) then
        player:setMaskBit(player:getVar("StampHunt_Mask"),"StampHunt_Mask",1,true);
    end

end;
