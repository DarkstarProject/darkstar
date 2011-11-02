-----------------------------------
--
-- Zone: Valkurm_Dunes
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

	--[[if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == 1 and player:hasItem(1125)) then
		colors = player:getVar("iCanHearAR-Lights");
		red = (tonumber(colors) % 2 >= 1);
		orange = (tonumber(colors) % 4 >= 2);
		yellow = (tonumber(colors) % 8 >= 4);
		green = (tonumber(colors) % 16 >= 8);
		blue = (tonumber(colors) % 32 >= 16);
		indigo = (tonumber(colors) % 64 >= 32);
		violet = (tonumber(colors) % 128 >= 64);

		ruby = 0x0003;

		if (red == false) then
			cs = ruby
			--param = 4;
		end

	end
--]]
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

	if (csid == 0x0003) then
		player:updateEvent(0,0,4);
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
end;



