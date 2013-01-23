-----------------------------------
-- Area: The_Shrouded_Maw
-- Name: darkness_named
-----------------------------------
package.loaded["scripts/zones/The_Shrouded_Maw/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/The_Shrouded_Maw/TextIDs");
require("scripts/globals/missions");
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
local inst = player:getInstanceID();
--printf("instance: %u",inst);
       if(inst == 1)then
       if(GetNPCByID(16818241):getAnimation() == 8)then GetNPCByID(16818241):setAnimation(9);end	
       if(GetNPCByID(16818242):getAnimation() == 8)then GetNPCByID(16818242):setAnimation(9);end	      	 
       if(GetNPCByID(16818243):getAnimation() == 8)then GetNPCByID(16818243):setAnimation(9);end 		 
       if(GetNPCByID(16818244):getAnimation() == 8)then GetNPCByID(16818244):setAnimation(9);end	      		 
       if(GetNPCByID(16818245):getAnimation() == 8)then GetNPCByID(16818245):setAnimation(9);end    	 
       if(GetNPCByID(16818246):getAnimation() == 8)then GetNPCByID(16818246):setAnimation(9);end	    	 
       if(GetNPCByID(16818247):getAnimation() == 8)then GetNPCByID(16818247):setAnimation(9);end	     	 
       if(GetNPCByID(16818248):getAnimation() == 8)then GetNPCByID(16818248):setAnimation(9);end  
 
         if(GetMobAction(16818205) > 0)then DespawnMob(16818205);end
		 if(GetMobAction(16818206) > 0)then DespawnMob(16818206);end
		 if(GetMobAction(16818207) > 0)then DespawnMob(16818207);end
		 if(GetMobAction(16818208) > 0)then DespawnMob(16818208);end
		 if(GetMobAction(16818209) > 0)then DespawnMob(16818209);end
		 if(GetMobAction(16818210) > 0)then DespawnMob(16818210);end 
	   
		 if(GetMobAction(16818178) == 0)then SpawnMob(16818178);end
		 if(GetMobAction(16818179) == 0)then SpawnMob(16818179);end
		 if(GetMobAction(16818180) == 0)then SpawnMob(16818180);end
		 if(GetMobAction(16818181) == 0)then SpawnMob(16818181);end
		 if(GetMobAction(16818182) == 0)then SpawnMob(16818182);end
		 if(GetMobAction(16818183) == 0)then SpawnMob(16818183);end
       elseif(inst == 2)then
	     if(GetNPCByID(16818249):getAnimation() == 8)then GetNPCByID(16818249):setAnimation(9);end         
         if(GetNPCByID(16818250):getAnimation() == 8)then GetNPCByID(16818250):setAnimation(9);end        	
         if(GetNPCByID(16818251):getAnimation() == 8)then GetNPCByID(16818251):setAnimation(9);end         
         if(GetNPCByID(16818252):getAnimation() == 8)then GetNPCByID(16818252):setAnimation(9);end        	
         if(GetNPCByID(16818253):getAnimation() == 8)then GetNPCByID(16818253):setAnimation(9);end        	
         if(GetNPCByID(16818254):getAnimation() == 8)then GetNPCByID(16818254):setAnimation(9);end         	
         if(GetNPCByID(16818255):getAnimation() == 8)then GetNPCByID(16818255):setAnimation(9);end        	
         if(GetNPCByID(16818256):getAnimation() == 8)then GetNPCByID(16818256):setAnimation(9);end
		 
		 if(GetMobAction(16818212) > 0)then DespawnMob(16818212);end
		 if(GetMobAction(16818213) > 0)then DespawnMob(16818213);end
		 if(GetMobAction(16818214) > 0)then DespawnMob(16818214);end
		 if(GetMobAction(16818215) > 0)then DespawnMob(16818215);end
		 if(GetMobAction(16818216) > 0)then DespawnMob(16818216);end
		 if(GetMobAction(16818217) < 0)then DespawnMob(16818217);end 
		 
		 if(GetMobAction(16818185) == 0)then SpawnMob(16818185);end
		 if(GetMobAction(16818186) == 0)then SpawnMob(16818186);end
		 if(GetMobAction(16818187) == 0)then SpawnMob(16818187);end
		 if(GetMobAction(16818188) == 0)then SpawnMob(16818188);end
		 if(GetMobAction(16818189) == 0)then SpawnMob(16818189);end
		 if(GetMobAction(16818190) == 0)then SpawnMob(16818190);end 
	   elseif(inst == 3)then
	     if(GetNPCByID(16818257):getAnimation() == 8)then GetNPCByID(16818257):setAnimation(9);end       	
         if(GetNPCByID(16818258):getAnimation() == 8)then GetNPCByID(16818258):setAnimation(9);end       
         if(GetNPCByID(16818259):getAnimation() == 8)then GetNPCByID(16818259):setAnimation(9);end        
         if(GetNPCByID(16818260):getAnimation() == 8)then GetNPCByID(16818260):setAnimation(9);end      
         if(GetNPCByID(16818261):getAnimation() == 8)then GetNPCByID(16818261):setAnimation(9);end      
         if(GetNPCByID(16818262):getAnimation() == 8)then GetNPCByID(16818262):setAnimation(9);end        	
         if(GetNPCByID(16818263):getAnimation() == 8)then GetNPCByID(16818263):setAnimation(9);end
         if(GetNPCByID(16818264):getAnimation() == 8)then GetNPCByID(16818264):setAnimation(9);end
		 
		 if(GetMobAction(16818219) > 0)then DespawnMob(16818219);end
		 if(GetMobAction(16818220) > 0)then DespawnMob(16818220);end
		 if(GetMobAction(16818221) > 0)then DespawnMob(16818221);end
		 if(GetMobAction(16818222) > 0)then DespawnMob(16818222);end
		 if(GetMobAction(16818223) > 0)then DespawnMob(16818223);end
		 if(GetMobAction(16818224) > 0)then DespawnMob(16818224);end 
		 
		 if(GetMobAction(16818192) == 0)then SpawnMob(16818192);end
		 if(GetMobAction(16818193) == 0)then SpawnMob(16818193);end
		 if(GetMobAction(16818194) == 0)then SpawnMob(16818194);end
		 if(GetMobAction(16818195) == 0)then SpawnMob(16818195);end
		 if(GetMobAction(16818196) == 0)then SpawnMob(16818196);end
		 if(GetMobAction(16818197) == 0)then SpawnMob(16818197);end 
	   end
	   
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function OnBcnmLeave(player,instance,leavecode)
-- print("leave code "..leavecode);
	
	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		if(player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 2) then
		    player:addTitle(TRANSIENT_DREAMER);
            player:setVar("PromathiaStatus",3);		
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
		else
		    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0); 
		end
	elseif(leavecode == 4) then
		player:startEvent(0x7d02);
	end
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
        
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

	
end;	
