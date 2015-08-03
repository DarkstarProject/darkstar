-----------------------------------
-- Area: Metalworks
-- NPC:  Alois
-- Involved in Missions: Wading Beasts
-- @pos 96 -20 14 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getCurrentMission(BASTOK) == WADING_BEASTS and trade:hasItemQty(4362,1) and trade:getItemCount() == 1) then -- Trade Lizard Egg
		if (player:hasCompletedMission(BASTOK,WADING_BEASTS) == false) then
			player:startEvent(0x0174);
		else
			player:startEvent(0x0175);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 0) then
player:startEvent(0x0305);
elseif (player:getVar("BASTOK91") == 1) then
player:startEvent(0x0306);
elseif (player:getVar("BASTOK91") == 3) then
player:startEvent(0x0307);
elseif (player:getVar("BASTOK91") == 4) then
player:startEvent(0x0308);
else	
player:startEvent(0x0172);
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
	
	if (csid == 0x0174 or csid == 0x0175) then
		finishMissionTimeline(player,1,csid,option);
	elseif (csid == 0x0305) then
	player:setVar("BASTOK91",1);
	elseif (csid == 0x0308) then
	player:setVar("BASTOK91",0);
	player:completeMission(BASTOK,THE_SALT_OF_THE_EARTH);
	player:addRankPoints(1500);
	player:setVar("OptionalcsCornelia",1);
	end
	
end;