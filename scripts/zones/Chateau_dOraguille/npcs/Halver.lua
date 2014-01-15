-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Halver
-- Involved in Mission 2-3, 3-3, 5-1, 5-2, 8-1
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos 2 0.1 0.1 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
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
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local pNation = player:getNation();
	local currentMission = player:getCurrentMission(pNation);
	local WildcatSandy = player:getVar("WildcatSandy");
	
	if(player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,16) == false) then
		player:startEvent(0x022e);
	-- Blackmail quest
	elseif(player:getQuestStatus(SANDORIA, BLACKMAIL) == QUEST_ACCEPTED and player:hasKeyItem(SUSPICIOUS_ENVELOPE)) then
		player:startEvent(0x0225);
		player:setVar("BlackMailQuest",1);
		player:delKeyItem(SUSPICIOUS_ENVELOPE);
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
		elseif(currentMission == THE_SHADOW_LORD and player:hasKeyItem(SHADOW_FRAGMENT) and MissionStatus == 4) then
			player:startEvent(0x0224);
		elseif(currentMission == THE_SHADOW_LORD and MissionStatus == 5) then
			player:showText(npc,HALVER_OFFSET+471);
		elseif(player:hasCompletedMission(SANDORIA,THE_SHADOW_LORD) and currentMission == 255) then
			player:showText(npc,HALVER_OFFSET+500);
	    elseif(currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 0) then
	        player:startEvent(0x0019);
	    elseif(currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 1) then
	        player:startEvent(0x0017);
	    elseif(currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 2) then
	        player:startEvent(0x0018);		
	    elseif(currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 3) then
            player:startEvent(0x0016);
		-- Mission San D'Oria 6-1 Leaute's last wishes
		elseif(player:getCurrentMission(SANDORIA) == LEAUTE_S_LAST_WISHES and MissionStatus == 0) then
			player:startEvent(0x0019);
		elseif(player:getCurrentMission(SANDORIA) == LEAUTE_S_LAST_WISHES and MissionStatus == 1) then
			player:startEvent(0x0017);
		elseif(player:getCurrentMission(SANDORIA) == LEAUTE_S_LAST_WISHES and MissionStatus == 2) then
			player:startEvent(0x0018);		
		elseif(player:getCurrentMission(SANDORIA) == LEAUTE_S_LAST_WISHES and MissionStatus == 3) then
			player:startEvent(0x0016);
		-- Mission San d'Oria 8-1 Coming of Age -- 
		elseif(player:getCurrentMission(SANDORIA) == COMING_OF_AGE and MissionStatus == 1) then
			player:startEvent(0x003A);
		elseif(player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:hasKeyItem(DROPS_OF_AMNIO) and MissionStatus == 3) then
			player:startEvent(0x0066);
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
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",16,true);
	elseif(csid == 0x01F8) then
		player:setVar("MissionStatus",9);
	elseif(csid == 0x0222) then
		player:setVar("MissionStatus",1);
	elseif(csid == 0x01fb or csid == 0x0224 or csid == 0x0215 or csid == 0x0216) then
		finishMissionTimeline(player,3,csid,option);
	elseif(csid == 0x0019) then
		player:setVar("MissionStatus",1);
	elseif(csid == 0x0016) then
		player:setVar("MissionStatus",4);
	elseif(csid == 0x003A) then
		player:setVar("MissionStatus",2);
	elseif(csid == 0x0066) then
		finishMissionTimeline(player,3,csid,option);
		player:setVar("Wait1DayM8-1_date", os.date("%j"));
	end
	
end;
