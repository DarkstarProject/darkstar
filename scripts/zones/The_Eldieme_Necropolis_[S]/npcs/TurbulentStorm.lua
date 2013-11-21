-----------------------------------
--  Area: The Eldieme Necropolis [S]
--  NPC:  Turbulent Storm
--  Note: Starts Quest "The Fighting Fourth"
--  @pos 422 -48 -47 175
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local WotgStatus = player:getVar("wotgStatus");	

	if((player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING) and WotgStatus == 0)
		then player:startEvent(0x0007);
	elseif((player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING) and WotgStatus == 12)then
		player:startEvent(0x0008);
	end
	return cs;
end;
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
	if(csid == 0x0007 and option == 0) then
		player:addKeyItem(BLUE_RECOMMENDATION_LETTER);
		player:messageSpecial(KEYITEM_OBTAINED,BLUE_RECOMMENDATION_LETTER);
		player:setVar("WotgStatus",12);
	end
end;

