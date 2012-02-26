-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Endracion
-- @zone 230
-- @pos -110 1 -34
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(trade:hasItemQty(16656,1) and trade:getItemCount() == 1) then -- Trade Orcish Axe
		if(player:getCurrentMission(SANDORIA) == SMASH_THE_ORCISH_SCOUTS) then
			player:startEvent(0x03ea); -- Finish Mission "Smash the Orcish scouts"
		else
			player:startEvent(0x03f2); -- Mission not activated
		end
	elseif(trade:hasItemQty(1112,1) and trade:getItemCount() == 1 and player:hasCompletedMission(SANDORIA,BAT_HUNT) == false) then -- Trade Orcish Mail Scales
		if(player:getCurrentMission(SANDORIA) == BAT_HUNT) then
			if(player:getVar("MissionStatus") == 2) then
				player:startEvent(0x03ff); -- Finish Mission "Bat Hunt"
			end
		else
			player:startEvent(0x03f2); -- Mission not activated
		end
	elseif(trade:hasItemQty(891,1) and trade:getItemCount() == 1 and player:hasCompletedMission(SANDORIA,BAT_HUNT)) then -- Trade Bat Fang
		if(player:getCurrentMission(SANDORIA) == BAT_HUNT) then
			if(player:getVar("MissionStatus") == 2) then
				player:startEvent(0x03eb); -- Finish Mission "Bat Hunt" (repeat)
			end
		else
			player:startEvent(0x03f2); -- Mission not activated
		end
	elseif(trade:hasItemQty(4528,1) and trade:getItemCount() == 1) then -- Trade Crystal Bass
		if(player:getCurrentMission(SANDORIA) == THE_CRYSTAL_SPRING) then
			if(player:hasCompletedMission(SANDORIA,THE_CRYSTAL_SPRING)) then
				player:startEvent(0x03f5); -- Finish Mission "The Crystal Spring" (repeat)
			else
				player:startEvent(0x0406);
			end
		else
			player:startEvent(0x03f2); -- Mission not activated
		end
	else
		player:startEvent(0x03f0); -- Wrong Item
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	CurrentMission = player:getCurrentMission(SANDORIA);
	
	if(player:getNation() ~= SANDORIA) then
		player:startEvent(0x03F3); -- for Non-San d'Orians
	elseif(CurrentMission == SAVE_THE_CHILDREN and player:getVar("saveTheChildrenMissionCS") == 5) then
		if(player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN) == false) then
			player:startEvent(0x03ec); -- Finish Mission "Save the Children" with rank
		else
			player:startEvent(0x0400); -- Finish Mission "Save the Children" (repeat)
		end
	elseif(CurrentMission == THE_RESCUE_DRILL and player:getVar("theRescueDrillMissionCS") == 11) then
		player:startEvent(0x03ed); -- Finish Mission "The Rescue Drill"
	elseif(CurrentMission == INFILTRATE_DAVOI and player:getVar("MissionStatus") == 10) then
		player:startEvent(0x03f4); -- Finish Mission "Infiltrate Davoi"
	elseif(CurrentMission ~= 255) then
		player:startEvent(0x03e9); -- Have mission already activated
	else
		if(player:getRank() == 1 and player:hasCompletedMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS) == false) then
			player:startEvent(0x03e8); -- Start First Mission "Smash the Orcish scouts"
		else
			mission_mask, repeat_mask = getMissionMask(player);
			player:startEvent(0x03F1,mission_mask, 0, 0 ,0 ,0 ,repeat_mask); -- Mission List
		end
	end
	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("onUpdateCSID: %u",csid);
printf("onUpdateOPTION: %u",option);
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("onFinishCSID: %u",csid);
printf("onFinishOPTION: %u",option);
	
	if((csid == 0x03e8 or csid == 0x03F1) and option == 0) then ----- MISSION 1-1
		player:addMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03ea) then
		player:tradeComplete();
		player:addRankPoints(150);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS);
	elseif(csid == 0x03F1 and option == 101) then ----- MISSION 1-2
		player:addMission(SANDORIA,BAT_HUNT);
		player:setVar("MissionStatus",1);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03eb or csid == 0x03ff) then
		player:tradeComplete();
		player:addRankPoints(200);
		player:setVar("MissionStatus",0);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,BAT_HUNT);
	elseif(csid == 0x03F1 and option == 102) then ----- MISSION 1-3
		if(player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN) == false) then
			player:setVar("saveTheChildrenMissionCS",1);
		else
			player:setVar("saveTheChildrenMissionCS",2);
		end
		player:addMission(SANDORIA,SAVE_THE_CHILDREN);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03ec) then
		player:setRank(2);
		player:delKeyItem(ORCISH_HUT_KEY);
		player:setVar("saveTheChildrenMissionCS",6);
		player:addRankPoints(250);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:addGil(GIL_RATE*1000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1000);
		player:completeMission(SANDORIA,SAVE_THE_CHILDREN);
	elseif(csid == 0x0400) then
		player:delKeyItem(ORCISH_HUT_KEY);
		player:setVar("saveTheChildrenMissionCS",0);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,SAVE_THE_CHILDREN);
	elseif(csid == 0x03F1 and option == 3) then ----- MISSION 2-1
		player:addMission(SANDORIA,THE_RESCUE_DRILL);
		player:setVar("theRescueDrillMissionCS",1);
		player:setVar("saveTheChildrenMissionCS",0);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03ed) then
		player:delKeyItem(RESCUE_TRAINING_CERTIFICATE);
		player:setVar("theRescueDrillMissionCS",0);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,THE_RESCUE_DRILL);
	elseif(csid == 0x03F1 and option == 104) then ----- MISSION 2-2
		player:addMission(SANDORIA,THE_DAVOI_REPORT);
		player:setVar("theDavoiReportMissionCS",1);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03F1 and option == 5) then ----- MISSION 2-3
		player:addMission(SANDORIA,JOURNEY_ABROAD);
		player:setVar("MissionStatus",1);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03F1 and option == 110) then ----- MISSION 3-1
		player:addMission(SANDORIA,INFILTRATE_DAVOI);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
		if(player:hasCompletedMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS)) then
			player:setVar("MissionStatus",5);
		else
			player:setVar("MissionStatus",1);
		end
	elseif(csid == 0x03f4) then
		player:setVar("MissionStatus",0);
		player:addRankPoints(350);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,INFILTRATE_DAVOI);
	elseif(csid == 0x03F1 and option == 111) then ----- MISSION 3-2
		player:addMission(SANDORIA,THE_CRYSTAL_SPRING);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
		player:setVar("MissionStatus",1);
	elseif(csid == 0x0406) then
		player:tradeComplete();
		player:setVar("MissionStatus",2);
	elseif(csid == 0x03f5) then
		player:tradeComplete();
		player:setVar("MissionStatus",0);
		player:addRankPoints(400);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,THE_CRYSTAL_SPRING);
	elseif(csid == 0x03F1 and option == 12) then ----- MISSION 3-3
		player:addMission(SANDORIA,APPOINTMENT_TO_JEUNO);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
		player:setVar("MissionStatus",1);
	end
	
end;