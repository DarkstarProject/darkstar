-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Rouva
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos -17 2 10 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	
	local WildcatSandy = player:getVar("WildcatSandy");
	
	if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,2) == false) then
		player:startEvent(0x0328);
	else
		player:startEvent(0x0298);
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
	
	if (csid == 0x0328) then
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",2,true);
	end
	
end;