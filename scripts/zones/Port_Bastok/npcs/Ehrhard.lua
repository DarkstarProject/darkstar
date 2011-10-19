-----------------------------------
-- Area: Port Bastok
-- NPC: Ehrhard
-- Involved in Quest: Stamp Hunt
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

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
	checkStamp = testflag(tonumber(stampCount),0x20);

    if (StampHunt == 1 and checkStamp == false) then
        player:setVar("StampHunt_Event",stampCount+0x20);
        player:startEvent(0x0079);
    else
        player:startEvent(0x002f);
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




