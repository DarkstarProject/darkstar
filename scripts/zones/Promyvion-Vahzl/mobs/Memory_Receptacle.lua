-----------------------------------	
-- Area: Promyvion vahzl	
-- MOB:  Memory_Receptacle	
-----------------------------------	
	

	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	local mobID = mob:getID();
	local difX = killer:getXPos()-mob:getXPos();
	local difY = killer:getYPos()-mob:getYPos();
	local difZ = killer:getZPos()-mob:getZPos();
	local Distance = math.sqrt( math.pow(difX,2) + math.pow(difY,2) + math.pow(difZ,2) ); --calcul de la distance entre les "killer" et le memory receptacle
	--print(mobID);
	switch (mob:getID()) : caseof {
		[16867387] = function (x) 
		GetNPCByID(16867697):openDoor(180);
		    if(Distance <4)then 
			        killer:startEvent(32); --ok
			end
		end,
		[16867382] = function (x) 
		GetNPCByID(16867696):openDoor(180);
			if(Distance <4)then 
					killer:startEvent(33); -- ok		
			end
		end,
		[16867429] = function (x) 
		GetNPCByID(16867694):openDoor(180);
			if(Distance <4)then 
					killer:startEvent(30); -- ok
			end
		end,
		[16867436] = function (x) 
		GetNPCByID(16867695):openDoor(180);
			if(Distance <4)then 
					killer:startEvent(31); -- ok		
			end
		end,
		[16867501] = function (x) 
		GetNPCByID(16867700):openDoor(180);
			if(Distance <4)then 
					killer:startEvent(35); -- ok
			end
		end,
		[16867515] = function (x) 
		GetNPCByID(16867702):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(36); --ok
			end
		end,
		[16867494] = function (x) 
		GetNPCByID(16867699):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(37); --ok
			end
		end,
		[16867508] = function (x) 
		GetNPCByID(16867701):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(38); --ok
			end
		end,
		[16867604] = function (x) 
		GetNPCByID(16867704):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(34); --ok
			end
		end,
		[16867586] = function (x) 
		GetNPCByID(16867698):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(39); --ok
			end
		end,
		[16867595] = function (x) 
		GetNPCByID(16867703):openDoor(180);
		    if(Distance <4)then 
			        killer:startEvent(40);--ok
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
end;