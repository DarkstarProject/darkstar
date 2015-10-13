-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Deraquien
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos -98 -2 31 230
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
	
	if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,4) == false) then
		player:startEvent(0x032b);
	else
		player:startEvent(0x012);
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
	
	if (csid == 0x032b) then
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",4,true);
	end
	
end;

---------other CS
--	player:startEvent(0x028e) -- nothing to report 
--	player:startEvent(0x0021)-- theif of royl sceptre  
--	player:startEvent(0x002f)-- as again about the theif  
--	player:startEvent(0x0022) -- reminder of theif in la thein 
--	player:startEvent(0x0050)  -- thief caught but phillone was there
--	player:startEvent(0x0014)  -- go get reward for thief
--	player:startEvent(0x0057) -- vijrtall shows up and derq tells you go talk tho phillone 
--	player:startEvent(0x001e) --reminder go talk to phillone 
--	player:startEvent(0x0026) -- go help  retrieve royal sceptre 
--	player:startEvent(0x001b) -- the lady wanst involved in the theft :( 
