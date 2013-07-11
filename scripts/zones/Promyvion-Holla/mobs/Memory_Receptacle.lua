-----------------------------------	
-- Area: Promyvion Mea	
-- MOB: Memory_Receptacle
-----------------------------------	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)		
	local rand = 0;
	local mobID = mob:getID();
	local difX = killer:getXPos()-mob:getXPos();
	local difY = killer:getYPos()-mob:getYPos();
	local difZ = killer:getZPos()-mob:getZPos();
	local killeranimation = killer:getAnimation();
	local Distance = math.sqrt( math.pow(difX,2) + math.pow(difY,2) + math.pow(difZ,2) ); --calcul de la distance entre les "killer" et le memory receptacle
	print(mobID);
	if(VanadielMinute() % 2 == 1) then
		killer:setVar("MemoryReceptacle",2);
		rnd = 2;
	else
		killer:setVar("MemoryReceptacle",1);
		rnd = 1;
	end
		switch (mob:getID()) : caseof {
		[16842781] = function (x) 
		GetNPCByID(16843055):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
			  killer:startEvent(0x0025);
			end
		end,
		[16842839] = function (x)
		GetNPCByID(16843051):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
				if(rnd == 2) then
					killer:startEvent(0x0021);
				else
					killer:startEvent(0x0022);
				end
			end
		end,
		[16842846] = function (x) 
		GetNPCByID(16843052):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
				if(rnd == 2) then
					killer:startEvent(0x0021);
				else
					killer:startEvent(0x0022);
				end
			end
		end,
		[16842860] = function (x)
		GetNPCByID(16843054):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
				if(rnd == 2) then
					killer:startEvent(0x0021);
				else
					killer:startEvent(0x0022);
				end
			end
		end,
		[16842853] = function (x) 
		GetNPCByID(16843053):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
				if(rnd == 2) then
					killer:startEvent(0x0021);
				else
					killer:startEvent(0x0022);
				end
			end
		end,
		[16842886] = function (x) 
		GetNPCByID(16843048):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(0x001E); 
			end
		end,
		[16842895] = function (x) 
		GetNPCByID(16843049):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(0x001E);
			end
		end,
		[16842904] = function (x) 
		GetNPCByID(16843050):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(0x001E)
			end
		end,
		[16842938] = function (x) 
		GetNPCByID(16843056):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(0x001E);
			end
		end,
		[16842947] = function (x) 
		GetNPCByID(16843057):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(0x001E);
			end
		end,
		[16842956] = function (x) 
		GetNPCByID(16843058):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(0x001E);
			end
		end,
	}

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (option==1)then
	player:setVar("MemoryReceptacle",0);
	end
end;