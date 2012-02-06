-----------------------------------
--
-- Zone: East_Sarutabaruta
--
-----------------------------------

package.loaded["scripts/globals/missions"] = nil;
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("scripts/zones/East_Sarutabaruta/TextIDs");

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
	-- Check if we are on Windurst Mission 1-2
	printf( "prevzone: %d", prevZone);
	if(player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER and player:getVar("windurst_mission_1_2") == 6 and prevZone == 194) then
		-- Play cutscene
		--player:startEvent(0x30);
		cs = 0x30;
		-- Set the progress
		player:setVar("windurst_mission_1_2",7);
	end
	
	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 1 and player:hasItem(1125)) then
		colors = player:getVar("ICanHearARainbow");
		o = (tonumber(colors) % 4 >= 2);

		cs = 0x0032;

		if (o == false) then
			player:setVar("ICanHearARainbow_Weather",1);
			player:setVar("ICanHearARainbow",colors+2);
		else
			cs = -1;
		end
	end

return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
	if (csid == 0x0032) then
		weather = player:getVar("ICanHearARainbow_Weather");

		if (weather == 1) then
			weather = 0;
		end

		if (player:getVar("ICanHearARainbow") < 127) then
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
	if(csid == 0x30) then
		-- Remove the glowing orb key items
		player:delKeyItem(FIRST_GLOWING_MANA_ORB);
		player:delKeyItem(SECOND_GLOWING_MANA_ORB);
		player:delKeyItem(THIRD_GLOWING_MANA_ORB);
		player:delKeyItem(FOURTH_GLOWING_MANA_ORB);
		player:delKeyItem(FIFTH_GLOWING_MANA_ORB);
		player:delKeyItem(SIXTH_GLOWING_MANA_ORB);
	elseif (csid == 0x0032) then
		player:setVar("ICanHearARainbow_Weather",0);
	end
end;
