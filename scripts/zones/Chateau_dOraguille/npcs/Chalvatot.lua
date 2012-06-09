-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Chalvatot
-- Finish Mission "The Crystal Spring"
-- @pos -105 0 72 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
end;

-----------------------------------
-- alreadyCheckedNPC
-----------------------------------

function alreadyCheckedNPC(player,number)
	
	local wildcatSandy = player:getVar("wildcatSandy_var");
	local bit = {};
	
	for i = 19,0,-1 do 
		twop = 2^i;
		if(wildcatSandy >= twop) then
			bit[i+1] = 1;
			wildcatSandy = wildcatSandy - twop;
		else
			bit[i+1] = 0;
		end;
	end;
		
	if(bit[number] == 0) then
		return false;
	else
		return true;
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and alreadyCheckedNPC(player,20) == false) then
		player:startEvent(0x0231);
	elseif(player:getCurrentMission(SANDORIA) == THE_CRYSTAL_SPRING and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x022c);
	else
		player:startEvent(0x0213);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x022c) then
		finishMissionTimeline(player,3,csid,option);
	elseif(csid == 0x0231) then
		player:setVar("wildcatSandy_var",player:getVar("wildcatSandy_var") + 524288);
	end
	
end;