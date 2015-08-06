-----------------------------------
-- Area: Nashmau
-- NPC: Leleroon
-- Standard Info NPC -- Corsair SideQuests
-- @pos -14.687 0.000 25.114 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Nashmau/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS) == QUEST_ACCEPTED and player:getVar("NavigatingtheUnfriendlySeas") <= 2) then
		if (trade:hasItemQty(2341,1) and trade:getItemCount() == 1) then -- Trade Hydrogauage
			player:startEvent(0x11B);
			player:setVar("NavigatingtheUnfriendlySeas",2);
		end
	
	end
end;  

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	
	local mJob = player:getMainJob();
	local mLvl = player:getMainLvl();
	
	if (player:getVar("AgainstAllOddsSideQuests") == 1 and mJob == 17 and mLvl >= AF3_QUEST_LEVEL) then
		player:startEvent(0x11A); -- CS with 3 Options
	else
		player:startEvent(0x0108); -- Basic Dialog	
	end
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);


	if (option == 0) then
	
	elseif (option == 1) then
		if (player:hasKeyItem(LELEROONS_LETTER_RED) or player:hasKeyItem(LELEROONS_LETTER_BLUE) or player:hasKeyItem(LELEROONS_LETTER_GREEN) == false) then  -- 
			player:addKeyItem(LELEROONS_LETTER_GREEN);
			player:messageSpecial(KEYITEM_OBTAINED,LELEROONS_LETTER_GREEN)
			player:setVar("LeleroonsLetterGreen",1);
			player:setVar("AgainstAllOddsSideQuests",2);
		end
	elseif (option == 2) then 
		if (player:hasKeyItem(LELEROONS_LETTER_RED) or player:hasKeyItem(LELEROONS_LETTER_BLUE) or player:hasKeyItem(LELEROONS_LETTER_GREEN) == false) then -- 
			player:addKeyItem(LELEROONS_LETTER_BLUE);
			player:messageSpecial(KEYITEM_OBTAINED,LELEROONS_LETTER_BLUE)
			player:setVar("LeleroonsLetterBlue",1);
			player:setVar("AgainstAllOddsSideQuests",2);
		end	
	elseif (option == 3) then 
		if (player:hasKeyItem(LELEROONS_LETTER_RED) or player:hasKeyItem(LELEROONS_LETTER_BLUE) or player:hasKeyItem(LELEROONS_LETTER_GREEN) == false) then -- 
			player:addKeyItem(LELEROONS_LETTER_RED);
			player:messageSpecial(KEYITEM_OBTAINED,LELEROONS_LETTER_RED)
			player:setVar("LeleroonsLetterRed",1);
			player:setVar("AgainstAllOddsSideQuests",2);
		end
	end		

end;



