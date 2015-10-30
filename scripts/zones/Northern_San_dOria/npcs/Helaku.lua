-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Helaku
-- Involved in Missions 2-3
-- @zone 231
-- @pos 49 -2 -12
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local currentMission = player:getCurrentMission(BASTOK);
	local missionStatus = player:getVar("MissionStatus");

	if (currentMission == THE_EMISSARY) then
		-- Bastok Mission 2-3 Part I - San d'Oria > Windurst
		if (missionStatus == 1) then
			player:startEvent(0x02a4);
		elseif (missionStatus == 2) then
			player:startEvent(0x0218);
		elseif (missionStatus == 3) then
			player:showText(npc,HELAKU_DIALOG);
		-- Bastok Mission 2-3 Part II - Windurst > San d'Oria
		elseif (missionStatus == 7) then
			player:startEvent(0x0219);
		elseif (missionStatus == 11) then
			player:startEvent(0x022d);
		end
	-- Bastok Mission 2-3 Part I - San d'Oria > Windurst
	elseif (currentMission == THE_EMISSARY_SANDORIA) then
		if (missionStatus <= 4) then
			player:startEvent(0x021e);
		else
			player:startEvent(0x021f);
		end
	-- Bastok Mission 2-3 Part II - Windurst > San d'Oria
	elseif (currentMission == THE_EMISSARY_SANDORIA2) then
		missionStatus = player:getVar("MissionStatus");
		if (missionStatus == 8) then
			player:startEvent(0x0219);
		elseif (missionStatus == 9) then
			player:startEvent(0x021e);
		elseif (player:hasKeyItem(KINDRED_CREST)) then
			player:startEvent(0x0221);
		end
	else
		player:startEvent(0x021d);
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

	if (csid == 0x0218) then
		player:setVar("MissionStatus",3);
	elseif (csid == 0x021f) then
		player:addMission(BASTOK,THE_EMISSARY);
		player:setVar("MissionStatus",6);
	elseif (csid == 0x0219 and option == 0) then
		player:addMission(BASTOK,THE_EMISSARY_SANDORIA2);
		player:setVar("MissionStatus",8);
	elseif (csid == 0x0221) then
		player:addMission(BASTOK,THE_EMISSARY);
		player:setVar("MissionStatus",11);
		player:addKeyItem(KINDRED_REPORT);
		player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
		player:delKeyItem(KINDRED_CREST);
	end
end;