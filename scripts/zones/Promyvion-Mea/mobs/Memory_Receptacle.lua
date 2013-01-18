-----------------------------------	
-- Area: Promyvion Mea	
-- MOB:  Memory_Receptacle	
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
		[16859151] = function (x) 
		GetNPCByID(16859450):openDoor(180);
		    if(Distance <4)then 
			        killer:startEvent(30);
			end
		end,
		[16859198] = function (x) 
		GetNPCByID(16859453):openDoor(180);
			if(Distance <4)then 
			 	if(rnd == 2)then
					killer:startEvent(37); -- player:setPos(-167,0,172,38);						
				else
					killer:startEvent(33); -- player:setPos(68,0,-76,254);		
				end
			end
		end,
		[16859205] = function (x) 
		GetNPCByID(16859457):openDoor(180);
			if(Distance <4)then 
			 	if(rnd == 2)then	
					killer:startEvent(37); -- player:setPos(-167,0,172,38);
				else
					killer:startEvent(33); -- player:setPos(68,0,-76,254);
				end
			end
		end,
		[16859212] = function (x) 
		GetNPCByID(16859458):openDoor(180);
			if(Distance <4)then 
			 	if(rnd == 2)then	
					killer:startEvent(37); -- player:setPos(-167,0,172,38);		
				else
					killer:startEvent(33); -- player:setPos(68,0,-76,254);
				end
			end
		end,
		[16859219] = function (x) 
		GetNPCByID(16859459):openDoor(180);
			if(Distance <4)then 
			 	if(rnd == 2)then	
					killer:startEvent(37); -- player:setPos(-167,0,172,38);
				else
					killer:startEvent(33); -- player:setPos(68,0,-76,254);
				end
			end
		end,
		[16859273] = function (x) 
		GetNPCByID(16859451):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(31);
			end
		end,
		[16859282] = function (x) 
		GetNPCByID(16859452):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(31);
			end
		end,
		--[16859291] = function (x) 
		--GetNPCByID(16859454):openDoor(180);
			--if(Distance <4)then 
			 
			--end
		--end,
		[16859349] = function (x) 
		GetNPCByID(16859455):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(31);
			end
		end,
		[16859358] = function (x) 
		GetNPCByID(16859456):openDoor(180);
			if(Distance <4)then 
			        killer:startEvent(31);
			end
		end,
		[16859367] = function (x) 
		GetNPCByID(16859460):openDoor(180);
		    if(Distance <4)then 
			        killer:startEvent(31);
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