-----------------------------------
-- Area: Maquette Abdhaljs-Legion
--  NPC: Legion Tome
-- Legion NPC
-- @pos 180 12 -251 183
-----------------------------------
package.loaded["scripts/zones/Maquette_Abdhaljs-Legion/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/zones/Maquette_Abdhaljs-Legion/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getPartySize() < 3) then
		player:messageSpecial(PARTY_TOO_SMALL);
	else
		local HALL_ID = player:getVar("Legion_Hall_ID");
		if (HALL_ID > 0) then
			-- player:addStatusEffectEx(EFFECT_LEGION, EFFECT_BATTLEFIELD, HALL_ID, 0, 0, 0, 0, 0);
			HALL_ID = HALL_ID -1;
			player:startEvent(10002, HALL_ID)
		end
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("onUpdate CSID: %u", csid);
	-- printf("onUpdate RESULT: %u", option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("onFinish CSID: %u", csid);
	-- printf("onFinish RESULT: %u", option);
	local party = player:getParty();
	if (csid == 10000) then
		-- ?
	elseif (csid == 10001) then
		-- ?
	elseif (csid == 10002 and option == 1) then
		if (player:getVar("Legion_Hall_ID") == 1) then -- An
		elseif (player:getVar("Legion_Hall_ID") == 2) then -- Ki
		elseif (player:getVar("Legion_Hall_ID") == 3) then -- Im
		elseif (player:getVar("Legion_Hall_ID") == 4) then -- Muru
		elseif (player:getVar("Legion_Hall_ID") == 5) then -- Mul
		-- elseif (player:getVar("Legion_Hall_ID") == 127) then -- Mars
			-- Mars needs instance code.
		end
	elseif (csid == 10003 and option == 1) then -- Victory
		player:setVar("Legion_Hall_ID", 0);
		player:setPos(237.5, 24.5, 466.4, 192, 110);
	elseif (csid == 10004 and option == 999) then -- Failure
		player:setVar("Legion_Hall_ID", 0);
		player:setPos(237.5, 24.5, 466.4, 192, 110);
	end
end;