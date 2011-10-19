-----------------------------------
-- Area: Norg
-- NPC: Aeka
-- Involved in Quest: Forge Your Destiny
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
require("scripts/zones/Norg/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil	= trade:getGil();
	questItem = player:getVar("ForgeYourDestiny_Event");
	checkItem = testflag(tonumber(questItem),0x01);	
	
	if (checkItem == true) then
		if (trade:hasItemQty(DARKSTEEL_ORE,1) and count == 1 and gil == 0) then
			player:startEvent(0x002f,0,ORIENTAL_STEEL,DARKSTEEL_ORE);
		end
	end
end; 

-----------------------------------
-- Event Check
-----------------------------------

function testflag(set,flag)
	return (set % (2*flag) >= flag)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)	
	swordTimer = player:getVar("ForgeYourDestiny_timer")

	if (player:getQuestStatus(OUTLANDS,FORGE_YOUR_DESTINY) == 1 and swordTimer == 0) then
		if (player:hasItem(BOMB_STEEL)) then
			player:startEvent(0x0030,BOMB_STEEL);
		elseif (player:hasItem(ORIENTAL_STEEL) == false) then
			questItem = player:getVar("ForgeYourDestiny_Event");
			checkItem = testflag(tonumber(questItem),0x01);
	
			if (checkItem == false) then
				player:startEvent(0x002c,BOMB_STEEL,ORIENTAL_STEEL);
			elseif (checkItem == true) then
				player:startEvent(0x002e,0,ORIENTAL_STEEL,DARKSTEEL_ORE);
			end
		elseif (player:hasItem(ORIENTAL_STEEL)) then
			player:startEvent(0x002d,BOMB_STEEL,ORIENTAL_STEEL);
		end
	elseif (swordTimer > 0) then
		player:startEvent(0x0032);
	else
		player:startEvent(0x0078);
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
	
	questItem = player:getVar("ForgeYourDestiny_Event");
	
	if (csid == 0x002c) then
		if (player:getFreeSlotsCount(0) >= 1) then
			player:addItem(ORIENTAL_STEEL);
			player:messageSpecial(ITEM_OBTAINED, ORIENTAL_STEEL);
			player:setVar("ForgeYourDestiny_Event",questItem + 0x01);
		else
		   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, ORIENTAL_STEEL);
		end
	elseif (csid == 0x002f) then
		if (player:getFreeSlotsCount(0) >= 1) then
			player:tradeComplete();
			player:addItem(ORIENTAL_STEEL);
			player:messageSpecial(ITEM_OBTAINED, ORIENTAL_STEEL);
		else
		   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, ORIENTAL_STEEL);
		end
	end
end;

