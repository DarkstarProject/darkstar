-----------------------------------
-- Area: Bastok-Jeuno Airship
-- NPC:  Michele
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Bastok-Jeuno_Airship/TextIDs"] = nil;

require("scripts/zones/Bastok-Jeuno_Airship/TextIDs");

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

	while vHour >= 6 do
		vHour = vHour - 6;
	end

	local message = WILL_REACH_BASTOK;

	if (vHour ==  0) then
		if (vMin >= 13) then
			vHour = 3;
			message = WILL_REACH_JEUNO;
		end
	elseif (vHour == 1) then
		vHour = 2;
		message = WILL_REACH_JEUNO;
	elseif (vHour == 2) then
		vHour = 1;
		message = WILL_REACH_JEUNO;	
	elseif (vHour == 3) then
		if (vMin <= 11) then
			vHour = 0;
			message = WILL_REACH_JEUNO;
		end
	elseif (vHour == 4) then
		vHour = 2;
	elseif (vHour == 5) then
		vHour = 1;
	end

	local vMinutes = 0;

	if (message == WILL_REACH_JEUNO) then
		vMinutes = (vHour * 60) + 11 - vMin;
	else -- WILL_REACH_BASTOK
		vMinutes = (vHour * 60) + 13 - vMin;
	end

	if (vMinutes <= 30) then
		if ( message == WILL_REACH_BASTOK) then
			message = IN_BASTOK_MOMENTARILY;
		else -- WILL_REACH_JEUNO
			message = IN_JEUNO_MOMENTARILY;
		end
	elseif (vMinutes < 60) then
		vHour = 0;
	end

	player:messageSpecial( message, math.floor((2.4 * vMinutes) / 60), math.floor( vMinutes / 60 + 0.5));
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
