-----------------------------------
-- Area: Port Bastok
-- NPC: Latifah
-- Involved in Quest: Stamp Hunt
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	function testflag(set,flag)
		return (set % (2*flag) >= flag)
	end

    StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);
    stampCount = player:getVar("StampHunt_Event");
	checkStamp = testflag(tonumber(stampCount),0x40);

    if(StampHunt == QUEST_ACCEPTED and checkStamp == false) then
        player:setVar("StampHunt_Event",stampCount+0x40);
        player:startEvent(0x0078);
    else
        player:startEvent(0x000d);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;