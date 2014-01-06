-----------------------------------
-- Area: Mine_Shaft_2716
-- Name: century_of_hardship
-- bcnmID : 736
     --ennemy:
        --    Chekochuk (Black Mage) 16830466 16830471 16830476 group 388 pool 707  i 1023
        --    Movamuq (White Mage)   16830465 16830470 16830475 group 404 pool 2766
        --    Swipostik (Thief)      16830468 16830473 16830478 group 407 pool 3828
        --    Trikotrak (Red Mage)   16830467 16830472 16830477 group 410 pool 4005
         --    Bugbby (Warrior)       16830469 16830474 16830479 group 386 pool 559
		 
		 --inst 2 -54 -1 -100
		 --	    24,2,30,62
		 --     15,2,30,62
		 --		24,2,23,62
		 --     15,2,23,63
		 --     20,2,22,61
         --inst 3 425 -121 -99	
		 --     504,-117,22,62
		 --     495,-117,22,62
		 --     495,-117,28,62
		 --     504,-117,28,62
		 --     499,-117,19,62		 
-----------------------------------
package.loaded["scripts/zones/Mine_Shaft_2716/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Mine_Shaft_2716/TextIDs");

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
		if(player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Louverance_s_Path") == 5) then
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);	
			player:setVar("COP_Louverance_s_Path",6);
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