-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Femitte
--  General Info NPC
--  Involved in Quest: Distant Loyalties
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

DistantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");
Fame = player:getFameLevel(SANDORIA);
DistantLoyalties = player:getQuestStatus(SANDORIA,DISTANT_LOYALTIES);

	if (Fame >= 4 and DistantLoyalties == 0) then
		player:startEvent(0x0297);
	elseif (DistantLoyalties == 1 and DistantLoyaltiesProgress == 1) then
		player:startEvent(0x0298);
	elseif (DistantLoyalties == 1 and DistantLoyaltiesProgress == 4 and player:hasKeyItem(MYTHRIL_HEARTS)) then
		player:startEvent(0x0299);
	else
	player:startEvent(0x295);
	end;
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

	if (csid == 0x0297 and option == 0) then
		player:addKeyItem(GOLDSMITHING_ORDER);
		player:messageSpecial(KEYITEM_OBTAINED,GOLDSMITHING_ORDER);
		player:addQuest(DISTANT_LOYALTIES);
		player:getVar("DistantLoyaltiesProgress");
		player:setVar("DistantLoyaltiesProgress",1);
	elseif (csid == 0x0299) then
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13585);
		else
			player:delKeyItem(MYTHRIL_HEARTS);
			player:addItem(13585,1);
			player:messageSpecial(ITEM_OBTAINED,13585);
			player:setVar("DistantLoyaltiesProgress",0);
			player:completeQuest(SANDORIA,DISTANT_LOYALTIES);
		end;
	end;
end;




