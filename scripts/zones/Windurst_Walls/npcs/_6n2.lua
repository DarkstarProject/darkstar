-----------------------------------
-- Area: Windurst Walls
-- Door: House of the Hero
-- Involved in Mission 2-1
-- Involved In Quest: Know One's Onions, Onion Rings
-- @pos -26 -13 260 239
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- Check for Missions first (priority?)
	if(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS and player:getVar("MissionStatus") == 5) then
		player:startEvent(0x0151);
	else
		if(player:hasKeyItem(JOKER_CARD)) then
			player:startEvent(0x0183,0,264);
		elseif(player:getVar("WildCard") == 1) then
			player:startEvent(0x0182);
		elseif(player:getVar("OnionRings") == 1) then
			player:startEvent(0x0121);
		elseif(player:getVar("KnowOnesOnions") == 1) then
			player:startEvent(0x0120,0,4387);
		elseif(player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 0) then
			if(player:getMainLvl() >= 30 and player:hasItem(1125)) then
				player:startEvent(0x0180,1125,1125,1125,1125,1125,1125,1125,1125);
			end
		elseif(player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 1) then
			player:startEvent(0x0181,1125,1125,1125,1125,1125,1125,1125,1125);
		end
	end

	return 1;

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if(csid == 0x0120) then
		player:setVar("KnowOnesOnions",2);
	elseif(csid == 0x0121) then
		player:completeQuest(WINDURST,ONION_RINGS);
		player:addFame(WINDURST,WIN_FAME*100);
		player:addTitle(STAR_ONION_BRIGADIER);
		player:delKeyItem(130);
		player:setVar("OnionRingsTime",0);
		player:setVar("OnionRings",2);
	elseif(csid == 0x0180) then
		player:addQuest(WINDURST, I_CAN_HEAR_A_RAINBOW);
	elseif(csid == 0x0182) then
		player:setVar("WildCard",2);
	elseif(csid == 0x0183) then
		player:delKeyItem(264);
		player:addGil(GIL_RATE*8000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*8000);
	elseif(csid == 0x0151) then
		-- Mark the progress
		player:setVar("MissionStatus",6);
	end

end;