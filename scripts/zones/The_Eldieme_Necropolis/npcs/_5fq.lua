-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  West Plate
-- @zone 195
-- @pos 150 -32 14
-- 17576329
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local state0 = 8;
	local state1 = 9;
	if (npc:getAnimation() == 8) then
		state0 = 9;
		state1 = 8;
	end
	-- Gates
	-- Shiva's Gate
	GetNPCByID(17576304):setAnimation(state0);
	GetNPCByID(17576305):setAnimation(state0);
	GetNPCByID(17576306):setAnimation(state0);
	GetNPCByID(17576307):setAnimation(state0);
	GetNPCByID(17576308):setAnimation(state0);
	-- Odin's Gate
	GetNPCByID(17576309):setAnimation(state1);
	GetNPCByID(17576310):setAnimation(state1);
	GetNPCByID(17576311):setAnimation(state1);
	GetNPCByID(17576312):setAnimation(state1);
	GetNPCByID(17576313):setAnimation(state1);
	-- Leviathan's Gate
	GetNPCByID(17576314):setAnimation(state0);
	GetNPCByID(17576315):setAnimation(state0);
	GetNPCByID(17576316):setAnimation(state0);
	GetNPCByID(17576317):setAnimation(state0);
	GetNPCByID(17576318):setAnimation(state0);
	-- Titan's Gate
	GetNPCByID(17576319):setAnimation(state1);
	GetNPCByID(17576320):setAnimation(state1);
	GetNPCByID(17576321):setAnimation(state1);
	GetNPCByID(17576322):setAnimation(state1);
	GetNPCByID(17576323):setAnimation(state1);
	
	-- Plates
	-- East Plate
	GetNPCByID(17576324):setAnimation(state0);
	GetNPCByID(17576325):setAnimation(state0);
	-- North Plate
	GetNPCByID(17576326):setAnimation(state0);
	GetNPCByID(17576327):setAnimation(state0);
	-- West Plate
	GetNPCByID(17576328):setAnimation(state0);
	GetNPCByID(17576329):setAnimation(state0);
	-- South Plate
	GetNPCByID(17576330):setAnimation(state0);
	GetNPCByID(17576331):setAnimation(state0);
	return 0;
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
end;