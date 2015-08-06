-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- NPC:  Runic Portal
-- Arrapago Reef Teleporter Back to Aht Urgan Whitegate
-- @pos 206.500 -1.220 33.500 72
-- @pos 206.500 -1.220 6.500 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local Z = player:getZPos();
	
	if (Z > 27.5 and Z > 39.5) then -- Northern Stage point.
		if (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
			if (hasRunicPortal(player,6) == 1) then
				player:startEvent(0x0075);
			else
				player:startEvent(0x0079);
			end
		else
			player:messageSpecial(RESPONSE);
		end
	else
		if (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
			if (hasRunicPortal(player,6) == 1) then
				player:startEvent(0x0076);
			else
				player:startEvent(0x007a);
			end
		else
			player:messageSpecial(RESPONSE);
		end
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
printf("CSID: %u",csid);
printf("RESULT: %u",option);
	
	if ((csid == 0x0079 or csid == 0x007a) and option == 1) then
		player:addNationTeleport(AHTURHGAN,64);
		toChamberOfPassage(player);
	elseif ((csid == 0x0075 or csid == 0x0076) and option == 1) then
		toChamberOfPassage(player);
	end
	
end;