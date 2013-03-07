-----------------------------------
-- Area: Norg
-- NPC: Keal
-- Starts and Ends Quest: It's Not Your Vault
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	Vault = player:getQuestStatus(OUTLANDS,ITS_NOT_YOUR_VAULT);
	mLvl = player:getMainLvl();
	IronBox = player:hasKeyItem(SEALED_IRON_BOX);
	
	if(Vault == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 3 and mLvl >= 5) then
		player:startEvent(0x0024,SEALED_IRON_BOX); -- Start quest
	elseif(Vault == QUEST_ACCEPTED) then
		if(IronBox == true) then
			player:startEvent(0x0026); -- Finish quest
		else
			player:startEvent(0x0025,MAP_OF_THE_SEA_SERPENT_GROTTO); -- Reminder/Directions Dialogue
		end
	elseif(Vault == QUEST_COMPLETED) then
		player:startEvent(0x0027); -- New Standard Dialogue for everyone who has completed the quest
	else
		player:startEvent(0x0059); -- Standard Conversation
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
	if(csid == 0x0024 and option == 1) then
		player:addQuest(OUTLANDS,ITS_NOT_YOUR_VAULT);
	elseif (csid == 0x0026) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4961); 
		else
			player:delKeyItem(SEALED_IRON_BOX);
			player:addItem(4961); -- Scroll of Tonko: Ichi
			player:messageSpecial(ITEM_OBTAINED, 4961); 
			player:addFame(OUTLANDS,NORG_FAME*50);
			player:completeQuest(OUTLANDS,ITS_NOT_YOUR_VAULT);
		end
	end

end;



