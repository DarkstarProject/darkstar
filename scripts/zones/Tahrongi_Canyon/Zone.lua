-----------------------------------
--
-- Zone: Tahrongi_Canyon
--
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
require("scripts/zones/Tahrongi_Canyon/TextIDs");

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
		y = (tonumber(colors) % 8 >= 4);
		g = (tonumber(colors) % 16 >= 8);

		cs = 0x0023;

		if (y == false) then
			player:setVar("ICanHearARainbow_Weather",8);
			player:setVar("ICanHearARainbow",colors+4);
		elseif (g == false) then
			player:setVar("ICanHearARainbow_Weather",10);
			player:setVar("ICanHearARainbow",colors+8);
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

	if (csid == 0x0023) then
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

	if (csid == 0x0023) then
		player:setVar("ICanHearARainbow_Weather",0);
	end
end;
