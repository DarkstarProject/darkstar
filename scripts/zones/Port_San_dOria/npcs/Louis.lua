-----------------------------------
--  Area: Port San d'Oria
--   NPC: Louis
--  Type: Standard NPC
-----------------------------------

package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;

require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local vHour = VanadielHour();
	local vMin  = VanadielMinute();

	while vHour >= 3 do
		vHour = vHour - 6;
	end

	if (     vHour == -3) then vHour = 3;
	elseif ( vHour == -2) then vHour = 4;
	elseif ( vHour == -1) then vHour = 5;
	end

	local seconds = math.floor(2.4 * ((vHour * 60) + vMin));

	player:startEvent( 0x02FB, seconds, 0, 0, 0, 0, 0, 0, 0);
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
end;
