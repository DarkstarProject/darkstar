-----------------------------------
-- Author: Ezekyel
-- this function is used for npcs that change position every vanadiel game day
-----------------------------------
function OnGameDayAutomatisation()
	
	-- Storage Hole in Davoi
	local storHolePos = {--[[E-10]]{-177.925,4.000,-255.699},--[[F-6]]{-127.703,4.250,23.732}, --[[F-7]]{-127.822,4.250,-16.964},--[[F-9]]{-123.369,4.000,-231.972},--[[G-9]]{-51.570,4.127,-216.462},
						 --[[G-10]]{-55.960,2.958,-300.014}, --[[I-7]]{152.311,4.000,-74.176}, --[[I-8]]{153.514,4.250,-112.616},--[[J-7]]{188.988,4.000,-80.058},  --[[K-7]]{318.694,0.001,-58.646},
						 --[[K-8]]{299.717,0.001,-160.910},  --[[K-9]]{274.849,4.162,-213.599},--[[K-9]]{250.809,4.000,-240.509},--[[J-8]]{219.474,3.750,-128.170}, --[[I-9]]{86.749,-5.166,-166.414}};
	
	local storageHole = GetNPCByID(17388018);
	local randPos = 0;
	
	while(randPos == 0 or storHolePos[randPos][1] == storageHole:getXPos()) do
		randPos = math.random(1,15);
	end
	
	storageHole:setPos(storHolePos[randPos][1],storHolePos[randPos][2],storHolePos[randPos][3],0);
	
	-- Labyrinth of sacrarium
	local day = VanadielDayElement() ;
	local tbl;
	
	if(day == 3 or day == 7) then
		tbl = {9,9,8,8,9,9,8,9,8,8,9,8,8,8,9,8,9,8};
	elseif(day == 1 or day == 5) then
		tbl = {9,9,8,9,8,8,8,8,9,9,9,8,9,8,8,8,8,9};
	elseif(day == 0 or day == 4) then
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
	
		-- Ro'Maeve Moongates
	local direction = VanadielMoonDirection();
	local phase = VanadielMoonPhase();
	if(((direction == 2 and phase >= 90) or (direction == 1 and phase >= 95)) and GetNPCByID(17277171):getWeather() == 0) then
		GetNPCByID(17277171):openDoor(432);
		GetNPCByID(17277172):openDoor(432);
	end

	-- Can spawn Xolotl?
	local ToD = GetServerVariable("[POP]Xolotl");
	if (ToD <= os.time(t)) then
		DeterMob(16806215, false);
	end
end;

-----------------------------------
-- Author: deviltti
-- this function is used for npcs that change position every vanadiel game hour
-----------------------------------
function OnGameHourAutomatisation()

end;