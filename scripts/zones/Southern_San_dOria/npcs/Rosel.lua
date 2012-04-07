-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Rosel
-- Starts and Finishes Quest: Rosel the Armorer
-- @zone 230
-- @pos 
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	
	RoselTheArmorer = player:getQuestStatus(SANDORIA,ROSEL_THE_ARMORER);
	receiprForThePrince = player:hasKeyItem(RECEIPT_FOR_THE_PRINCE);
	
	if(player:getVar("RefuseRoselTheArmorerQuest") == 1 and RoselTheArmorer == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 1) then
		player:startEvent(0x020c);
	elseif(RoselTheArmorer == QUEST_AVAILABLE) then
		player:startEvent(0x020b);
		player:setVar("RefuseRoselTheArmorerQuest",1);
	elseif(RoselTheArmorer == QUEST_ACCEPTED and receiprForThePrince) then
		player:startEvent(0x020c);
	elseif(RoselTheArmorer == QUEST_ACCEPTED and receiprForThePrince == false) then
		player:startEvent(0x020f);
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

	-- Rosel the Armorer, get quest and receipt for prince
	if((csid == 0x020b or csid == 0x020c) and option == 0) then
		player:addQuest(SANDORIA, ROSEL_THE_ARMORER);
		player:setVar("RefuseRoselTheArmorerQuest",0);
		player:addKeyItem(RECEIPT_FOR_THE_PRINCE);
		player:messageSpecial(KEYITEM_OBTAINED,RECEIPT_FOR_THE_PRINCE);
	-- Rosel the Armorer, finished quest, recieve 200gil
	elseif(csid == 0x020f) then
		player:setTitle(ENTRANCE_DENIED);
		player:addGil(GIL_RATE*200);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
		player:addFame(SANDORIA,SAN_FAME*30);
		player:completeQuest(SANDORIA,ROSEL_THE_ARMORER);
	end
	
end;




