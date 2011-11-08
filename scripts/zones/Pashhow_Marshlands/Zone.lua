-----------------------------------
--
-- Zone: Pashhow_Marshlands
--
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Pashhow_Marshlands/TextIDs"] = nil;
require("scripts/zones/Pashhow_Marshlands/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

	if (prevZone = 147 and player:getCurrentMission(1) == 10) then
		missionStatus = player:getVar("MissionStatus");
		if (missionStatus < 22) then
			cs = 0x000a;
		elseif (missionStatus == 22) then
			cs = 0x000b;
		end
	elseif (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 1 and player:hasItem(1125)) then
		colors = player:getVar("ICanHearARainbow");
		b = (tonumber(colors) % 32 >= 16);
		v = (tonumber(colors) % 128 >= 64);

		cs = 0x000d;

		if (b == false) then
			player:setVar("ICanHearARainbow_Weather",6);
			player:setVar("ICanHearARainbow",colors+16);
		elseif (v == false) then
			player:setVar("ICanHearARainbow_Weather",14);
			player:setVar("ICanHearARainbow",colors+64);
		else
			cs = -1;
		end
	end
return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,regionID)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
	if (csid == 0x000d) then
		if (player:getVar("ICanHearARainbow") < 127) then
			weather = player:getVar("ICanHearARainbow_Weather");
			player:updateEvent(0,0,weather);
		else
			player:updateEvent(0,0,weather,6);
		end
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);

	if (csid == 0x000a) then
		player:setPos(578, 25, -376, 126);
	elseif (csid == 0x000b) then
		player:completeMission(1);
		player:addRankPoints(10);
		player:setVar("MissionStatus",0);
		player:setPos(578, 25, -376, 126);
	elseif (csid == 0x000d) then
		player:setVar("ICanHearARainbow_Weather",0);
	end
end;



