-----------------------------------
-- Area: Chateau d'Oraguille
-- Door: Prince Royal's
-- Finishes Quest: A Boy's Dream
-- Involved in Missions: 3-1, 5-2
-- @pos -38 -3 73 233
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
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local currentMission = player:getCurrentMission(SANDORIA);
	local MissionStatus = player:getVar("MissionStatus");
	local infiltrateDavoi = player:hasCompletedMission(SANDORIA,INFILTRATE_DAVOI);
	
	if(player:getVar("aBoysDreamCS") == 8) then 
		player:startEvent(0x0058);
	elseif(currentMission == INFILTRATE_DAVOI and infiltrateDavoi == false and MissionStatus == 0) then
		player:startEvent(0x0229,0,ROYAL_KNIGHTS_DAVOI_REPORT);
	elseif(currentMission == INFILTRATE_DAVOI and MissionStatus == 4) then
		player:startEvent(0x022a,0,ROYAL_KNIGHTS_DAVOI_REPORT);
	elseif(currentMission == THE_SHADOW_LORD and MissionStatus == 1) then
		player:startEvent(0x0223);
	elseif(currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 0) then
	    player:startEvent(0x0051);
	elseif(currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 7) then
	    player:startEvent(0x0015);
	else
		player:startEvent(0x020a);
	end
	
	return 1;
	
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
	
	if(csid == 0x0229) then
		player:setVar("MissionStatus",2);
	elseif(csid == 0x0223) then
		player:setVar("MissionStatus",2);
	elseif(csid == 0x022a) then
		finishMissionTimeline(player,3,csid,option);
	elseif(csid == 0x0058) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14095);
		else
			if(player:getMainJob() == 7) then 
				player:addQuest(SANDORIA,UNDER_OATH);
			end
			player:delKeyItem(KNIGHTS_BOOTS);
			player:addItem(14095);
			player:messageSpecial(ITEM_OBTAINED,14095); -- Gallant Leggings
			player:setVar("aBoysDreamCS",0);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,A_BOY_S_DREAM);
		end
	elseif(csid == 0x0051) then
	    player:setVar("MissionStatus",1);
	elseif(csid == 0x0015) then
	    player:setVar("MissionStatus",8);
	end
	
end;
