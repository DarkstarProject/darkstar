-----------------------------------
--
-- Zone: La_Theine_Plateau
--
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/zones/La_Theine_Plateau/TextIDs");

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

	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 1 and player:hasItem(1125)) then
		colors = player:getVar("ICanHearARainbow");
		g = (tonumber(colors) % 16 >= 8);
		b = (tonumber(colors) % 32 >= 16);

		cs = 0x007b;

		if (g == false) then
			player:setVar("ICanHearARainbow_Weather",10);
			player:setVar("ICanHearARainbow",colors+8);
		elseif (b == false) then
			player:setVar("ICanHearARainbow_Weather",6);
			player:setVar("ICanHearARainbow",colors+16);
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

	if (csid == 0x007b) then
		weather = player:getVar("ICanHearARainbow_Weather");
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

	if (csid == 0x007b) then
		player:setVar("ICanHearARainbow_Weather",0);
	end
end;
