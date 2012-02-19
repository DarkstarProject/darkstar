-----------------------------------
-- Area: Norg
-- NPC:  Jaucribaix
-- Starts and Finishes Quest: Forge Your Destiny, The Sacred Katana
-- @zone 252
-- @pos 91 -7 -8
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(OUTLANDS,FORGE_YOUR_DESTINY) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(1153,1) and trade:hasItemQty(1152,1) and trade:getItemCount() == 2) then -- Trade Sacred branch and Bomb Steel
			player:startEvent(0x001b);
		end
	end
	
	if(player:getQuestStatus(OUTLANDS,THE_SACRED_KATANA) == QUEST_ACCEPTED) then
		if(player:hasKeyItem(HANDFUL_OF_CRYSTAL_SCALES) and trade:hasItemQty(17809,1) and trade:getItemCount() == 1) then -- Trade Mumeito
			player:startEvent(0x008d);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	ForgeYourDestiny = player:getQuestStatus(OUTLANDS, FORGE_YOUR_DESTINY);
	theSacredKatana = player:getQuestStatus(OUTLANDS,THE_SACRED_KATANA);
	
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();

	if(player:getMainLvl() >= 30 and ForgeYourDestiny == QUEST_AVAILABLE) then
		player:startEvent(0x0019,1153,1152); -- Sacred branch, Bomb Steel
	elseif(ForgeYourDestiny == QUEST_ACCEPTED) then
		swordTimer = player:getVar("ForgeYourDestiny_timer");
		
		if(swordTimer > os.time()) then
			player:startEvent(0x001c,(swordTimer - os.time())/144);	
		elseif(swordTimer < os.time() and swordTimer ~= 0) then
			if(player:getFreeSlotsCount() == 0) then 
				player:messageSpecial(CARRYING_TOO_MUCH_ALREADY);
			else
				player:startEvent(0x001d, 17809); -- Finish Quest "Forge Your Destiny"
			end
		else
			player:startEvent(0x001a);
		end
	elseif(theSacredKatana == QUEST_AVAILABLE and mJob == 12 and mLvl >= 40) then
		player:startEvent(0x008b); -- Start Quest "The Sacred Katana"
	elseif(theSacredKatana == QUEST_ACCEPTED) then
		if(player:hasItem(17809) == false) then
			player:startEvent(0x008f); -- CS without Mumeito
		else
			player:startEvent(0x008c); -- CS with Mumeito
		end
	elseif(theSacredKatana == QUEST_COMPLETED) then
		player:startEvent(0x008e);
	else
		player:startEvent(0x0047);
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

	if(csid == 0x0019 and option == 1) then
		player:addQuest(OUTLANDS,FORGE_YOUR_DESTINY);
	elseif(csid == 0x001b) then
		player:tradeComplete();
		player:setVar("ForgeYourDestiny_timer", os.time() + 10368); --Add 3 game days
	elseif(csid == 0x001d) then
		player:tradeComplete();
		player:setTitle(BUSHIDO_BLADE);
		player:addItem(17809);
		player:messageSpecial(YOU_CAN_NOW_BECOME_A_SAMURAI, 17809); -- You can now become a samurai
		player:unlockJob(12); -- Samurai Job Unlocked
		player:setVar("ForgeYourDestiny_timer",0);
		player:setVar("ForgeYourDestiny_Event",0);
		player:addFame(OUTLANDS, NORG_FAME*30);
		player:completeQuest(OUTLANDS, FORGE_YOUR_DESTINY);		
	elseif(csid == 0x008b and option == 1) then
		player:addQuest(OUTLANDS,THE_SACRED_KATANA);
	elseif(csid == 0x008d) then
		player:tradeComplete();
		player:delKeyItem(HANDFUL_OF_CRYSTAL_SCALES);
		player:addItem(17812);
		player:messageSpecial(ITEM_OBTAINED,17812); -- Magoroku
		player:addFame(OUTLANDS,NORG_FAME*30);
		player:completeQuest(OUTLANDS,THE_SACRED_KATANA);	
	end
	
end;