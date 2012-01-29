-----------------------------------
-- Area: Norg
-- NPC:  Jaucribaix
-- Starts and Finishes Quest: Forge Your Destiny
-- @zone 252
-- @pos 91 -7 -8
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Sacred branch and Bomb Steel
	if(trade:hasItemQty(1153,1) and trade:hasItemQty(1152,1) and trade:getItemCount() == 2) then 
		player:startEvent(0x001b);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	ForgeYourDestiny = player:getQuestStatus(OUTLANDS, FORGE_YOUR_DESTINY);

	if(player:getMainLvl() >= 30 and ForgeYourDestiny == QUEST_AVAILABLE) then
		player:startEvent(0x0019,1153,1152); -- Sacred branch, Bomb Steel
	elseif(ForgeYourDestiny == QUEST_ACCEPTED) then
		swordTimer = player:getVar("ForgeYourDestiny_timer")
		
		if(swordTimer > os.time()) then
			player:startEvent(0x001c,(swordTimer - os.time())/144);	
		elseif(swordTimer < os.time() and swordTimer ~= 0) then
			if(player:getFreeSlotsCount() == 0) then 
				player:messageSpecial(10115); -- I wish to give you your reward, ... Come back when you have more room in your pack.
			else
				player:startEvent(0x001d, 17809); -- Finish Quest "Forge Your Destiny"
			end
		else
			player:startEvent(0x001a);
		end
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
		player:messageSpecial(10114, 17809); -- You can now become a samurai
		player:unlockJob(12); -- Samurai Job Unlocked
		player:setVar("ForgeYourDestiny_timer",0);
		player:setVar("ForgeYourDestiny_Event",0);
		player:addFame(OUTLANDS, NORG_FAME*30);
		player:completeQuest(OUTLANDS, FORGE_YOUR_DESTINY);		
	end
	
end;