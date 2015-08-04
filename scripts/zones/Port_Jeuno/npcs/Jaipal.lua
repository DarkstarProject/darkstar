-----------------------------------
-- Area: Port Jeuno
-- NPC: Jaipal
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;

require("scripts/zones/Port_Jeuno/TextIDs");

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

	while vHour >= 4 do
		vHour = vHour - 6;
	end

	if (     vHour == -2) then vHour = 4;
	elseif ( vHour == -1) then vHour = 5;
	end

	local seconds = math.floor(2.4 * ((vHour * 60) + vMin));

	player:startEvent( 0x272B, seconds, 0, 0, 0, 0, 0, 0, 0);
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
