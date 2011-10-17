-----------------------------------
-- Area: Port Bastok
-- NPC: Gudav
-- Starts Quests: A Foreman's Best Friend
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
DogCollar = trade:hasItemQty(13096,1);

	if(DogCollar == true and count == 1) then
		AForemans = player:getQuestStatus(BASTOK,A_FOREMAN_S_BEST_FRIEND);
		if (AForemans == 1) then
			player:tradeComplete();
			player:startEvent(0x0070);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

pLevel = player:getMainLvl();
AForemans = player:getQuestStatus(BASTOK,A_FOREMAN_S_BEST_FRIEND);
	
	if (pLevel >= 7 and AForemans == 0) then
		player:startEvent(0x006e);
	else
		player:startEvent(0x001f);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if (csid == 0x006e) then
		player:addQuest(BASTOK,A_FOREMAN_S_BEST_FRIEND);
	elseif (csid == 0x0070) then
		player:completeQuest(BASTOK,A_FOREMAN_S_BEST_FRIEND);
		player:addFame(BASTOK,BAS_FAME*60);
		player:addKeyItem(0x18E);
		player:messageSpecial(KEYITEM_OBTAINED,0x18E);
	end
			
end;



