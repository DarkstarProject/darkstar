-----------------------------------
-- Area: Heaven's Tower
-- NPC:  Kupipi
-- Involved in Mission 2-3
-- Involved in Quest: Riding on the Clouds
-- @pos 2 0 30 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 8) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_4",0);
			player:tradeComplete();
			player:addKeyItem(SPIRITED_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SPIRITED_STONE);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	pNation = player:getNation();
	currentMission = player:getCurrentMission(pNation);
	MissionStatus = player:getVar("MissionStatus");
	
	if(pNation == SANDORIA) then
		-- San d'Oria Mission 2-3 Part I - Windurst > Bastok
		if(currentMission == JOURNEY_TO_WINDURST) then
			if(MissionStatus == 4) then
				player:startEvent(0x00ee,1,1,1,1,pNation);
			elseif(MissionStatus == 5) then
				player:startEvent(0x00f0);
			elseif(MissionStatus == 6) then
				player:startEvent(0x00f1);
			end
		-- San d'Oria Mission 2-3 Part II - Bastok > Windurst
		elseif(currentMission == JOURNEY_TO_WINDURST2) then
			if(MissionStatus == 7) then
				player:startEvent(0x00f2,1,1,1,1,0);
			elseif(MissionStatus == 8) then
				player:startEvent(0x00f3);
			elseif(MissionStatus == 9) then
				player:startEvent(0x00f6);
			elseif(MissionStatus == 10) then
				player:startEvent(0x00f7);
			end
		else
			player:startEvent(0x00fb);
		end
	elseif(pNation == BASTOK) then
		-- Bastok Mission 2-3 Part I - Windurst > San d'Oria
		if(currentMission == THE_EMISSARY_WINDURST) then
			if(MissionStatus == 3) then
				player:startEvent(0x00ee,1,1,1,1,pNation);
			elseif(MissionStatus <= 5) then
				player:startEvent(0x00f0);
			elseif(MissionStatus == 6) then
				player:startEvent(0x00f1);
			end
		-- Bastok Mission 2-3 Part II - San d'Oria > Windurst
		elseif(currentMission == THE_EMISSARY_WINDURST2) then
			if(MissionStatus == 7) then
				player:startEvent(0x00f2,1,1,1,1,pNation);
			elseif(MissionStatus == 8) then
				player:startEvent(0x00f3);
			elseif(MissionStatus == 9) then
				player:startEvent(0x00f4);
			elseif(MissionStatus == 10) then
				player:startEvent(0x00f5);
			end
		else
			player:startEvent(0x00fb);
		end
	elseif(pNation == WINDURST) then
		if(currentMission == THE_THREE_KINGDOMS and MissionStatus == 0) then
			player:startEvent(0x005F,0,0,0,LETTER_TO_THE_CONSULS_WINDURST);
		elseif(currentMission == THE_THREE_KINGDOMS and MissionStatus == 11) then
			player:startEvent(0x0065,0,0,ADVENTURERS_CERTIFICATE);
		elseif(currentMission == THE_THREE_KINGDOMS) then
			player:startEvent(0x0061);
		elseif(currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 0) then
			player:startEvent(0x0067,0,0,STARWAY_STAIRWAY_BAUBLE);
		elseif(currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 1) then
			player:startEvent(0x0068);
		else
			player:startEvent(0x00fb);
		end
	else
		player:startEvent(0x00fb);
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
	
	if(csid == 0x00ee) then
		if(player:getNation() == BASTOK) then
			player:setVar("MissionStatus",4);
			player:addKeyItem(SWORD_OFFERING);
			player:messageSpecial(KEYITEM_OBTAINED,SWORD_OFFERING);
		else
			player:setVar("MissionStatus",5);
			player:addKeyItem(SHIELD_OFFERING);
			player:messageSpecial(KEYITEM_OBTAINED,SHIELD_OFFERING);
		end
	elseif(csid == 0x00f4 or csid == 0x00f6) then
		player:setVar("MissionStatus",10);
	elseif(csid == 0x00f2) then
		player:addKeyItem(DARK_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,DARK_KEY);
		player:setVar("MissionStatus",8);
	elseif(csid == 0x005F) then
		player:setVar("MissionStatus",1);
		player:addKeyItem(LETTER_TO_THE_CONSULS_WINDURST);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_CONSULS_WINDURST);
	elseif(csid == 0x0067) then
		player:setVar("MissionStatus",1);
		player:addKeyItem(STARWAY_STAIRWAY_BAUBLE);
		player:messageSpecial(KEYITEM_OBTAINED,STARWAY_STAIRWAY_BAUBLE);
	elseif(csid == 0x0065) then
		finishMissionTimeline(player,1,csid,option);
	end
	
end;