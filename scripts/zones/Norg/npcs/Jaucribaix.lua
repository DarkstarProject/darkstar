-----------------------------------
-- Area: Norg
-- NPC: Jaucribaix
-- Starts and Finishes Quest: Forge Your Destiny
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
require("scripts/zones/Norg/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil	= trade:getGil();
	
	if ( trade:hasItemQty(SACRED_BRANCH,1) and trade:hasItemQty(BOMB_STEEL,1) and count == 2 and gil == 0) then 
		player:startEvent(0x001b);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	ForgeYourDestiny = player:getQuestStatus(OUTLANDS, FORGE_YOUR_DESTINY);

	if (player:getMainLvl() >= 30 and ForgeYourDestiny == 0) then
		player:startEvent(0x0019,SACRED_BRANCH,BOMB_STEEL); 
	elseif (ForgeYourDestiny == 1) then
		swordTimer = player:getVar("ForgeYourDestiny_timer")
		
		if (swordTimer > os.time()) then
			player:startEvent(0x001c,(swordTimer - os.time())/144);	
		elseif (swordTimer < os.time() and swordTimer ~= 0) then
			player:startEvent(0x001d, MUMEITO);
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

	if (csid == 0x0019 and option == 1) then
		player:addQuest(OUTLANDS,FORGE_YOUR_DESTINY);
	elseif (csid == 0x001b) then
		player:tradeComplete();
		player:setVar("ForgeYourDestiny_timer", os.time() + 10368); --Add 3 game days
	elseif (csid == 0x001d) then
		player:tradeComplete();
		player:completeQuest(OUTLANDS, FORGE_YOUR_DESTINY);
		player:addItem(MUMEITO);
		player:messageSpecial(ITEM_OBTAINED, MUMEITO);
		player:setTitle(BUSHIDO_BLADE);
		player:addFame(OUTLANDS, NORG_FAME*20);
		player:unlockJob(12);
		player:setVar("ForgeYourDestiny_timer",0);
		plaery:setVar("ForgeYourDestiny_Event",0);
	end
end;