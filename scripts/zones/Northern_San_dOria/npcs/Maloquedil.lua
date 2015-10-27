-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Maloquedil
-- Involved in Quest : Warding Vampires, Riding on the Clouds, Lure of the Wildcat (San d'Oria)
-- @pos 35 0.1 60 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart Flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if (player:getQuestStatus(SANDORIA,WARDING_VAMPIRES) ~= QUEST_AVAILABLE) then
		if (trade:hasItemQty(1018,2) and trade:getItemCount() == 2) then -- Trade Shaman Garlic
			player:startEvent(0x0017);
		end
	end
	
	if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 4) then
		if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_1",0);
			player:tradeComplete();
			player:addKeyItem(SCOWLING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SCOWLING_STONE);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local warding = player:getQuestStatus(SANDORIA,WARDING_VAMPIRES);
	local WildcatSandy = player:getVar("WildcatSandy");
	
	if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,7) == false) then
		player:startEvent(0x0327);
	elseif (warding == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then --Quest available for fame superior or equal to 3
		player:startEvent(0x0018);
	elseif (warding == QUEST_ACCEPTED) then --Quest accepted, and he just tell me where to get item.
		player:startEvent(0x0016);
	elseif (warding == QUEST_COMPLETED) then --Since the quest is repeatable, he tells me where to find (again) the items.
		player:startEvent(0x0016);
	else
		player:startEvent(0x0015); 
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

	if (csid == 0x0018 and option == 1) then
		player:addQuest(SANDORIA,WARDING_VAMPIRES);
	elseif (csid == 0x0017) then
		player:tradeComplete();
		player:addTitle(VAMPIRE_HUNTER_DMINUS);
		player:addGil(GIL_RATE*900);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
		if (player:getQuestStatus(SANDORIA,WARDING_VAMPIRES) == QUEST_ACCEPTED) then
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,WARDING_VAMPIRES);
		else
			player:addFame(SANDORIA,SAN_FAME*5);
		end
	elseif (csid == 0x0327) then
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",7,true);
	end
end;
