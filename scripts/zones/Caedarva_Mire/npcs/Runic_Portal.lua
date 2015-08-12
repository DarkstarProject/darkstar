-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Runic Portal
-- Caedarva Mire Teleporter Back to Aht Urhgan Whitegate
-- @pos -264 -6 -28 79 (Dvucca)
-- @pos 524 -28 -503 79 (Azouph)
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/zones/Caedarva_Mire/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local X = player:getXPos();
	local Z = player:getZPos();

	if ((X < -258.512 and X > -270.512) and (Z < -22.285 and Z > -34.285)) then -- Dvucca Staging Point
		if (player:getCurrentMission(TOAU)== IMMORTAL_SENTRIES) then
			if (player:getVar("TOAUM2") == 1) then
				player:startEvent(0x007d);
			else
				player:startEvent(0x0086);
			end
		elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
			if (hasRunicPortal(player,2) == 1) then
				player:startEvent(0x0086);
			else
				player:startEvent(0x007d);
			end
		else
			player:messageSpecial(RESPONSE);
		end
	else 																		-- Azouph Staging Point
		if (player:getCurrentMission(TOAU)== IMMORTAL_SENTRIES) then
			if (player:getVar("TOAUM2") == 1) then
				player:startEvent(0x007c);
			else
				player:startEvent(0x0083);
			end
		elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
			if (hasRunicPortal(player,1) == 1) then
				player:startEvent(0x0083);
			else
				player:startEvent(0x007c);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x007c and option == 1) then
		if (player:getVar("TOAUM2") == 1) then
			player:setVar("TOAUM2",2);
		end
		player:addNationTeleport(AHTURHGAN,2);
		toChamberOfPassage(player);
	elseif (csid == 0x007d and option == 1) then
		if (player:getVar("TOAUM2") == 1) then
			player:setVar("TOAUM2",2);
		end
		player:addNationTeleport(AHTURHGAN,4);
		toChamberOfPassage(player);
	elseif ((csid == 0x0086 or 0x0083) and option == 1) then
		toChamberOfPassage(player);
	end
	
end;