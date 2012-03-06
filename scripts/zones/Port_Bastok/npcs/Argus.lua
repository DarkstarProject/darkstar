-----------------------------------
-- Area: Port Bastok
-- NPC:  Argus
-- Type: Mission Giver
-- @zone 236
-- @pos 132.157 7.496 -2.187
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	CurrentMission = player:getCurrentMission(BASTOK);
	FetichismCompleted = player:hasCompletedMission(BASTOK,FETICHISM);
	Count = trade:getItemCount();
	
	if(CurrentMission ~= 255) then
		if(CurrentMission == FETICHISM and FetichismCompleted == false and trade:hasItemQty(606,1) and trade:hasItemQty(607,1) and trade:hasItemQty(608,1) and trade:hasItemQty(609,1) and Count == 4) then
			player:startEvent(0x03F0);
		elseif(CurrentMission == FETICHISM and trade:hasItemQty(606,1) and trade:hasItemQty(607,1) and trade:hasItemQty(608,1) and trade:hasItemQty(609,1) and Count == 4) then
			player:startEvent(0x03ED);
		end
	else
		player:startEvent(0x03f2); -- Mission not activated
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getNation() ~= BASTOK) then
		player:startEvent(0x03eb); -- For non-Bastokian
	else
		CurrentMission = player:getCurrentMission(BASTOK);
		MissionStatus = player:getVar("MissionStatus");
		pRank = player:getRank();
		cs, p, offset = getMissionOffset(player,1,CurrentMission,MissionStatus);
		
		if(CurrentMission <= 15 and (cs ~= 0 or offset ~= 0 or (CurrentMission == 0 and offset == 0))) then
			if(cs == 0) then
				player:showText(npc,ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission
			else
				player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
			end
		elseif(CurrentMission > 15 and CurrentMission ~= 255) then
			player:showText(npc,ZILART_MISSION_OFFSET+delta);
		elseif(pRank == 1 and player:hasCompletedMission(BASTOK,THE_ZERUHN_REPORT) == false) then
			player:startEvent(0x03E8); -- Start First Mission "The Zeruhn Report"
		elseif(CurrentMission ~= 255) then
			player:startEvent(0x03EA); -- Have mission already activated
		else
		 	flagMission, repeatMission = getMissionMask(player);
		 	player:startEvent(0x03E9,flagMission,0,0,0,0,repeatMission); -- Mission List
		end
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

	finishMissionTimeline(player,1,csid,option);
	
end;