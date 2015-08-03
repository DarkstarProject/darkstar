-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Bertenont
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos -165 0.1 226 231
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
	
	if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,9) == false) then
		player:startEvent(0x0329);
	else
		player:showText(npc,BERTENONT_DIALOG);
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
	
	if (csid == 0x0329) then
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",9,true);
	end
	
end;