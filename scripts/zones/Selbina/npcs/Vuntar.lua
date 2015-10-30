-----------------------------------
-- Area: Selbina
-- NPC:  Vuntar
-- Starts and Finishes Quest: Cargo (R)
-- @pos 7 -2 -15 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(OTHER_AREAS,CARGO) ~= QUEST_AVAILABLE) then
		realday = tonumber(os.date("%j")); -- %M for next minute, %j for next real day
		starttime = player:getVar("VuntarCanBuyItem_date");
		
		if (realday ~= starttime) then
			if (trade:hasItemQty(4529,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
				player:startEvent(0x0034,1); -- Can Buy rolanberry (881 ce)
				
			elseif (trade:hasItemQty(4530,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
				player:startEvent(0x0034,2); -- Can Buy rolanberry (874 ce)
				
			elseif (trade:hasItemQty(4531,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
				player:startEvent(0x0034,3); -- Can Buy rolanberry (864 ce)
				
			end
		else
			player:startEvent(0x046e,4365); -- Can't buy rolanberrys
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getMainLvl() >= 20 and player:getQuestStatus(OTHER_AREAS,CARGO) == QUEST_AVAILABLE) then
		player:startEvent(0x0032,4365); -- Start quest "Cargo"
	elseif (player:getMainLvl() < 20) then
		player:startEvent(0x0035); -- Dialog for low level or low fame
	else
		player:startEvent(0x0033,4365); -- During & after completed quest "Cargo"
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
	if (csid == 0x0032) then 
		player:addQuest(OTHER_AREAS,CARGO);
	elseif (csid == 0x0034) then 
		player:setVar("VuntarCanBuyItem_date", os.date("%j")); -- %M for next minute, %j for next real day
		if (player:getQuestStatus(OTHER_AREAS,CARGO) == QUEST_ACCEPTED) then
			player:completeQuest(OTHER_AREAS,CARGO);
			player:addFame(OTHER_AREAS,30);
		end
		if (option == 1) then 
			player:addGil(800);
			player:messageSpecial(GIL_OBTAINED,800);
			player:tradeComplete();
		elseif (option == 2) then 
			player:addGil(2000);
			player:messageSpecial(GIL_OBTAINED,2000);
			player:tradeComplete();
		elseif (option == 3) then 
			player:addGil(3000);
			player:messageSpecial(GIL_OBTAINED,3000);
			player:tradeComplete();
		end
	end
end;



