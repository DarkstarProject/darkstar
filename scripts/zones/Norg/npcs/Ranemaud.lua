-----------------------------------
-- Area: Norg
-- NPC: Ranemaud
-- Involved in Quest: Forge Your Destiny
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
require("scripts/zones/norg/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil	= trade:getGil();
	questItem = player:getVar("ForgeYourDestiny_Event");
	checkItem = testflag(tonumber(questItem),0x02);	
	
	if (checkItem == true) then
		if (trade:hasItemQty(PLATINUM_ORE,1) and trade:hasItemQty(GOLD_ORE,2) and count == 3 and gil == 0) then
			player:startEvent(0x002b,0,0,PLATINUM_ORE,GOLD_ORE);
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
		if (player:hasItem(SACRED_BRANCH)) then
			player:startEvent(0x0030,SACRED_BRANCH);
		elseif (player:hasItem(SACRED_SPRIG) == false) then
			questItem = player:getVar("ForgeYourDestiny_Event");
			checkItem = testflag(tonumber(questItem),0x02);
	
			if (checkItem == false) then
				player:startEvent(0x0028,SACRED_BRANCH,SACRED_SPRIG);
			elseif (checkItem == true) then
				player:startEvent(0x002a,0,0,PLATINUM_ORE,GOLD_ORE);
			end
		elseif (player:hasItem(SACRED_SPRIG)) then
			player:startEvent(0x0029);
		end	
	else
		player:startEvent(0x0044);
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

	if (csid == 0x0028) then
		if (player:getFreeSlotsCount(0) >= 1) then
			player:addItem(SACRED_SPRIG);
			player:messageSpecial(ITEM_OBTAINED, SACRED_SPRIG);
			player:setVar("ForgeYourDestiny_Event",questItem + 0x02);
		else
		   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, ORIENTAL_STEEL);
		end
	elseif (csid == 0x002b) then
		if (player:getFreeSlotsCount(0) >= 1) then
			player:tradeComplete();
			player:addItem(SACRED_SPRIG);
			player:messageSpecial(ITEM_OBTAINED, SACRED_SPRIG);
		else
		   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, SACRED_SPRIG);
		end
	end
end;