-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Amutiyaal
--  Warp NPC (Aht Urhgan)
--	@pos 116 0 84 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if(player:hasCompletedMission(TOAU,IMMORTAL_SENTRIES) and player:hasCompleteQuest(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA)) then
		if(trade:getGil() == 300 and trade:getItemCount() == 1) then
			player:startEvent(0x0371);
		end
	end
	
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	
	local lureWildcatSandy = player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA);
	
	if(lureWildcatSandy == QUEST_AVAILABLE) then
		player:startEvent(0x032c);
	elseif(lureWildcatSandy == QUEST_ACCEPTED) then
		local wildcatSandy = player:getVar("wildcatSandy_var");
		
		if(wildcatSandy == 0) then
			player:startEvent(0x032e);
		elseif(wildcatSandy >= 0 and wildcatSandy < 1048575) then
			player:startEvent(0x032d);
		elseif(wildcatSandy == 1048575) then
			player:startEvent(0x032f);
		end
	elseif(lureWildcatSandy == QUEST_COMPLETED) then
		player:startEvent(0x0330);
	end
	
end; 

-- 0x032c  0x032d  0x032e  0x032f  0x0330  0x0370  0x0371

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
	
	if(csid == 0x032c) then
		player:addQuest(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA);
		player:addKeyItem(RED_SENTINEL_BADGE);
	elseif(csid == 0x032f) then
		player:delKeyItem(RED_SENTINEL_BADGE);
		player:addKeyItem(RED_INVITATION_CARD);
		player:messageSpecial(KEYITEM_OBTAINED,RED_INVITATION_CARD);
		player:setVar("wildcatSandy_var",0);
		player:completeQuest(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA);
	elseif(csid == 0x0371) then
		player:tradeComplete();
		toAhtUrhganWhitegate(player);
	end
	
end;