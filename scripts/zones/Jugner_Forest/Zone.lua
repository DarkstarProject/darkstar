-----------------------------------
--
-- Zone: Jugner_Forest
--
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
require("scripts/zones/Valkurm_Dunes/TextIDs");

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

	if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED and player:hasItem(1125)) then
		colors = player:getVar("ICanHearARainbow");
		b = (tonumber(colors) % 32 >= 16);
		v = (tonumber(colors) % 128 >= 64);

		cs = 0x000f;

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

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);

	if (csid == 0x000f) then
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

	if (csid == 0x000f) then
		player:setVar("ICanHearARainbow_Weather",0);
	end
end;
