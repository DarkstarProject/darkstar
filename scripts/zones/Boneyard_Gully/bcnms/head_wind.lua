-----------------------------------
-- Area: Boneyard_Gully
-- Name: head_wind
-- bcnmID : 672
     --ennemy:
--Shikaree X               16809987  16809992  16809997  group 240
--Shikaree X's Rabbit      16809989  16809994  16809999  group 241
--Shikaree Y               16809986  16809991  16809996  group 242
--Shikaree Z               16809985  16809990  16809995  group 243
--Shikaree Z's Wyvern      16809988  16809993  16809998  group 244
  		 
-----------------------------------
package.loaded["scripts/zones/Boneyard_Gully/TextIDs"] = nil;
-----------------------------------


require("scripts/globals/missions");
require("scripts/zones/Boneyard_Gully/TextIDs");

-----------------------------------
 




-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
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

	
	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		if(player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path") == 5) then
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);	
			player:setVar("COP_Ulmia_s_Path",6);
		else
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,1);			
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
    if(csid == 0x7d01)then
     player:addExp(1000);
	end
end;