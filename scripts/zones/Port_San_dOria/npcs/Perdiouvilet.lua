-----------------------------------
-- Area: Port San d'Oria
-- NPC:  Perdiouvilet
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos -59 -5 -29 232
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

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
	
	if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,10) == false) then
		player:startEvent(0x02ee);
	else
		player:startEvent(0x02fa);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if (csid == 0x02ee) then
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",10,true);
	end
	
end;