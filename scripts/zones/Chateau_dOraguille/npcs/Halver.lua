-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Halver
-- Involved in Mission 2-3, 3-3, 5-1, 5-2
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos 2 0 0 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
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
	
	-- TEMP -------------------
	if(player:getCurrentMission(SANDORIA) == 255 and player:hasKeyItem(MESSAGE_TO_JEUNO_SANDORIA)) then
		player:addMission(0,14);
	elseif(player:getNation() == 0 and player:getRank() == 5 and player:getCurrentMission(SANDORIA) == 255 and player:hasCompletedMission(0,14) == false) then
		player:addMission(0,14);
		player:setVar("MissionStatus",9);
	end	
	---------------------------
	
	pNation = player:getNation();
	currentMission = player:getCurrentMission(pNation);
	MissionStatus = player:getVar("MissionStatus");
	
	if(player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and alreadyCheckedNPC(player,17) == false) then
		player:startEvent(0x022e);
	elseif(pNation == SANDORIA) then
		if(currentMission == JOURNEY_ABROAD and MissionStatus == 0) then
			player:startEvent(0x01f9);
		elseif(currentMission == JOURNEY_ABROAD and MissionStatus == 11) then
			player:startEvent(0x01fb);
		elseif(currentMission == JOURNEY_ABROAD) then
			player:startEvent(0x0214);
		elseif(currentMission == APPOINTMENT_TO_JEUNO and MissionStatus == 0) then
			player:startEvent(0x01fc);
		elseif(currentMission == THE_RUINS_OF_FEI_YIN and MissionStatus == 9) then
			player:startEvent(0x0215);
		elseif(currentMission == THE_RUINS_OF_FEI_YIN and MissionStatus == 10) then
			player:showText(npc,HALVER_OFFSET+334);
		elseif(currentMission == THE_RUINS_OF_FEI_YIN and MissionStatus == 12 and player:hasKeyItem(BURNT_SEAL)) then
			player:startEvent(0x0216);
		elseif(currentMission == THE_SHADOW_LORD and MissionStatus == 0) then
			player:startEvent(0x0222);
		elseif(player:hasKeyItem(SHADOW_FRAGMENT) and MissionStatus == 3) then
			player:startEvent(0x0224);
		elseif(currentMission == THE_SHADOW_LORD and MissionStatus == 4) then
			player:showText(npc,HALVER_OFFSET+471);
		elseif(player:hasCompletedMission(SANDORIA,THE_SHADOW_LORD) and currentMission == 255) then
			player:showText(npc,HALVER_OFFSET+500);
		end
	elseif(pNation == BASTOK) then
		if(currentMission == THE_EMISSARY) then
			if(MissionStatus == 3) then
				player:startEvent(0x01f5);
			end
		elseif(currentMission == THE_EMISSARY_SANDORIA) then
			player:showText(npc,HALVER_OFFSET+279);
		elseif(currentMission == THE_EMISSARY_SANDORIA2) then
			MissionStatus = MissionStatus;
			if(MissionStatus == 8) then
				player:startEvent(0x01f7);
			elseif(MissionStatus <= 10) then
				player:showText(npc,HALVER_OFFSET+279);
			end
		else
			player:showText(npc,HALVER_OFFSET+1092);
		end
	elseif(pNation == WINDURST) then
		if(currentMission == THE_THREE_KINGDOMS and MissionStatus < 3) then
			player:startEvent(0x0214);
		elseif(currentMission == THE_THREE_KINGDOMS_SANDORIA or currentMission == THE_THREE_KINGDOMS_SANDORIA2) then
			if(MissionStatus == 3) then
				player:startEvent(0x01F6);
			elseif(MissionStatus == 8) then
				player:startEvent(0x01F8);
			else
				player:showText(npc,HALVER_OFFSET+279);
			end
		end
	else
		player:showText(npc,HALVER_OFFSET+1092);
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

	if(csid == 0x01f5) then
		player:addMission(BASTOK,THE_EMISSARY_SANDORIA);
		player:setVar("MissionStatus",4);
	elseif(csid == 0x01f7) then
		player:setVar("MissionStatus",9);
	elseif(csid == 0x01fc) then
		player:setVar("MissionStatus",2);
	elseif(csid == 0x01f9) then
		player:setVar("MissionStatus",2);
		player:addKeyItem(LETTER_TO_THE_CONSULS_SANDORIA);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_CONSULS_SANDORIA);
	elseif(csid == 0x01F6) then
		player:setVar("MissionStatus",4);
	elseif(csid == 0x022e) then
		player:setVar("wildcatSandy_var",player:getVar("wildcatSandy_var") + 65536);
	elseif(csid == 0x01F8) then
		player:setVar("MissionStatus",9);
	elseif(csid == 0x0222) then
		player:setVar("MissionStatus",1);
	elseif(csid == 0x01fb or csid == 0x0224 or csid == 0x0215 or csid == 0x0216) then
		finishMissionTimeline(player,3,csid,option);
	end
	
end;