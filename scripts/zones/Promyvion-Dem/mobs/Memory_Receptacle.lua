-----------------------------------	
-- Area: Promyvion-Dem
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
	--print(mobID);
	if(VanadielMinute() % 2 == 1) then
		killer:setVar("MemoryReceptacle",2);
		rnd = 2;
	else
		killer:setVar("MemoryReceptacle",1);
		rnd = 1;
	end
	
	switch (mob:getID()) : caseof {
		[16850971] = function (x) 
		GetNPCByID(16851265):openDoor(180); 
		    if(Distance <4 and killeranimation == 0)then 
			    killer:startEvent(30);  --testok
			end
		end,
		[16851025] = function (x)
		GetNPCByID(16851269):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
					if(rnd == 2) then
					killer:startEvent(35);  --testok
				    else
					killer:startEvent(34);  
				    end
			end
		end,
		[16851032] = function (x)
		GetNPCByID(16851270):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
				    if(rnd==2) then	
					killer:startEvent(35);  --testok
				    else
					killer:startEvent(34);  
				    end
			end		
		end,
		[16851039] = function (x)
		GetNPCByID(16851271):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
					if(rnd==2) then
					killer:startEvent(35); --testok 
				    else
					killer:startEvent(34);  
				    end
			end
		end,
		[16851046] = function (x)
		GetNPCByID(16851272):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
			  		if(rnd==2) then
					killer:startEvent(35);  
				    else
					killer:startEvent(34);  --testok 
				    end
			end
		end,
		[16851072] = function (x)
		GetNPCByID(16851266):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(32);  --testok 
			end
		end,
		[16851081] = function (x)
		GetNPCByID(16851267):openDoor(180);
			if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(32);   --testok 
			end
		end,
		[16851090] = function (x)
		GetNPCByID(16851268):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(32); --testok 
			end
		end,
		[16851149] = function (x)
		GetNPCByID(16851273):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(32);--testok
			end
		end,
		[16851158] = function (x)
		GetNPCByID(16851274):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(32);--testok
			end
		end,
		[16851167] = function (x)
		GetNPCByID(16851275):openDoor(180);
		    if(Distance <4 and killeranimation == 0)then 
			killer:startEvent(32); --testok
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