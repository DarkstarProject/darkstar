-----------------------------------
-- Author: Ezekyel
-- this function is used for npcs that change position every vanadiel game day
-----------------------------------

-- BY GAME DAY
-- Storage Hole at Davoi

-- BY GAME HOUR
-- flame spout

function OnGameDayAutomatisation()
	
	-- Labyrinth of sacrarium
	local day = VanadielDayElement() + 1;
	local tbl;
	
	if(day == 1 or day == 2) then
		tbl = {9,9,8,8,9,9,8,9,8,8,9,8,8,8,9,8,9,8};
	elseif(day == 3 or day == 4) then
		tbl = {9,9,8,9,8,8,8,8,9,9,9,8,9,8,8,8,8,9};
	elseif(day == 5 or day == 6) then
		tbl = {8,9,8,9,8,9,9,8,9,9,8,8,9,8,8,8,8,9};
	else
		tbl = {9,8,9,9,8,9,8,8,9,8,8,9,8,9,8,9,8,8};
	end
	
	GetNPCByID(16892107):setAnimation(tbl[1]);
	GetNPCByID(16892113):setAnimation(tbl[2]);
	GetNPCByID(16892119):setAnimation(tbl[3]);
	GetNPCByID(16892120):setAnimation(tbl[4]);
	GetNPCByID(16892108):setAnimation(tbl[5]);
	GetNPCByID(16892114):setAnimation(tbl[6]);
	GetNPCByID(16892121):setAnimation(tbl[7]);
	GetNPCByID(16892109):setAnimation(tbl[8]);
	GetNPCByID(16892115):setAnimation(tbl[9]);
	GetNPCByID(16892116):setAnimation(tbl[10]);
	GetNPCByID(16892110):setAnimation(tbl[11]);
	GetNPCByID(16892122):setAnimation(tbl[12]);
	GetNPCByID(16892123):setAnimation(tbl[13]);
	GetNPCByID(16892117):setAnimation(tbl[14]);
	GetNPCByID(16892111):setAnimation(tbl[15]);
	GetNPCByID(16892124):setAnimation(tbl[16]);
	GetNPCByID(16892118):setAnimation(tbl[17]);
	GetNPCByID(16892112):setAnimation(tbl[18]); 
	
end;