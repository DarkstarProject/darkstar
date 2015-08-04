-----------------------------------	
-- Area: Promyvion-Dem
-- MOB:  Memory Receptacle
-----------------------------------	
package.loaded["scripts/zones/Promyvion-Dem/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require( "scripts/zones/Promyvion-Dem/TextIDs" );
	
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
	mob:addMod(MOD_REGAIN, 100); -- 10% Regain for now
    mob:SetAutoAttackEnabled(false); -- Recepticles only use TP moves.
end;
	
-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob, target)

	 local Mem_Recep = mob:getID(); 

	if (Mem_Recep == 16850971) then -- Floor 1
		for i = Mem_Recep+1, Mem_Recep+3 do -- Keep pets linked
			if (GetMobAction(i) == 16) then
				GetMobByID(i):updateEnmity(target);
			end
		end
	 elseif (Mem_Recep == 16851025 or Mem_Recep == 16851032 or Mem_Recep == 16851039 or Mem_Recep == 16851046) then -- Floor 2
  	 for i = Mem_Recep+1, Mem_Recep+5 do 
      	if (GetMobAction(i) == 16) then
      	   GetMobByID(i):updateEnmity(target);
     	  end
   	 end   	 
	 elseif (Mem_Recep == 16851072 or Mem_Recep == 16851081 or Mem_Recep == 16851090 or Mem_Recep == 16851149 or Mem_Recep == 16851158 or -- Floor 3
	  Mem_Recep == 16851167) then 
  	 for i = Mem_Recep+1, Mem_Recep+7 do 
      	if (GetMobAction(i) == 16) then
      	   GetMobByID(i):updateEnmity(target);
     	  end
   	 end  
   end	 

   -- Summons a single stray every 30 seconds. 
   
   if (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16850971) and mob:AnimationSub() == 2) then -- Floor 1
      for i = Mem_Recep+1, Mem_Recep+3 do
         if (GetMobAction(i) == 0) then -- My Stray is deeaaaaaad!
         		mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1); -- Set stray x and z position +1 from Recepticle
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16851025 or Mem_Recep == 16851032 or Mem_Recep == 16851039 or -- Floor 2
    Mem_Recep == 16851046) and mob:AnimationSub() == 2) then 
      for i = Mem_Recep+1, Mem_Recep+5 do
         if (GetMobAction(i) == 0) then 
         		mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1); -- Set stray x and z position +1 from Recepticle
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16851072 or Mem_Recep == 16851081 or Mem_Recep == 16851090 or -- Floor 3
    Mem_Recep == 16851149 or Mem_Recep == 16851158 or Mem_Recep == 16851167) and mob:AnimationSub() == 2) then 
      for i = Mem_Recep+1, Mem_Recep+7 do
         if (GetMobAction(i) == 0) then 
			mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1);
            return;
         end
      end
   else
   		mob:AnimationSub(2); 
   end   
end;
		
		
		
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
	
	mob:AnimationSub(0); -- Set ani. sub to default or the recepticles wont work properly
		
	if (VanadielMinute() % 2 == 1) then
		killer:setVar("MemoryReceptacle",2);
		rnd = 2;
	else
		killer:setVar("MemoryReceptacle",1);
		rnd = 1;
	end
	
	switch (mob:getID()) : caseof {
		[16850971] = function (x) 
		GetNPCByID(16851268):openDoor(180); 
		    if (Distance <4 and killeranimation == 0) then 
			    killer:startEvent(30);  
			end
		end,
		[16851025] = function (x)
		GetNPCByID(16851272):openDoor(180);
			if (Distance <4 and killeranimation == 0) then 
					if (rnd == 2) then
					killer:startEvent(35);  
				    else
					killer:startEvent(34);  
				    end
			end
		end,
		[16851032] = function (x)
		GetNPCByID(16851273):openDoor(180);
			if (Distance <4 and killeranimation == 0) then 
				    if (rnd==2) then	
					killer:startEvent(35);  
				    else
					killer:startEvent(34);  
				    end
			end		
		end,
		[16851039] = function (x)
		GetNPCByID(16851274):openDoor(180);
			if (Distance <4 and killeranimation == 0) then 
					if (rnd==2) then
					killer:startEvent(35); 
				    else
					killer:startEvent(34);  
				    end
			end
		end,
		[16851046] = function (x)
		GetNPCByID(16851275):openDoor(180);
			if (Distance <4 and killeranimation == 0) then 
			  		if (rnd==2) then
					killer:startEvent(35);  
				    else
					killer:startEvent(34);  
				    end
			end
		end,
		[16851072] = function (x)
		GetNPCByID(16851269):openDoor(180);
			if (Distance <4 and killeranimation == 0) then 
			killer:startEvent(32);  
			end
		end,
		[16851081] = function (x)
		GetNPCByID(16851270):openDoor(180);
			if (Distance <4 and killeranimation == 0) then 
			killer:startEvent(32);   
			end
		end,
		[16851090] = function (x)
		GetNPCByID(16851271):openDoor(180);
		    if (Distance <4 and killeranimation == 0) then 
			killer:startEvent(32); 
			end
		end,
		[16851149] = function (x)
		GetNPCByID(16851276):openDoor(180);
		    if (Distance <4 and killeranimation == 0) then 
			killer:startEvent(32);
			end
		end,
		[16851158] = function (x)
		GetNPCByID(16851277):openDoor(180);
		    if (Distance <4 and killeranimation == 0) then 
			killer:startEvent(32);
			end
		end,
		[16851167] = function (x)
		GetNPCByID(16851278):openDoor(180);
		    if (Distance <4 and killeranimation == 0) then 
			killer:startEvent(32); 
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
   if (option==1) then
	player:setVar("MemoryReceptacle",0);
	end
end;