-----------------------------------
-- Area: Bastok Markets
-- NPC: Pavel
-- Involved in Quest: Stamp Hunt
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

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
	checkStamp = testflag(tonumber(stampCount),0x1);

    if (StampHunt == 1 and checkStamp == false) then
        player:setVar("StampHunt_Event",stampCount+0x1);
        player:startEvent(0x00e3);
    else
        player:startEvent(0x0080);
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
