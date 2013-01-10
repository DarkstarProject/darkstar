-----------------------------------
-- Area: Spire_of_Dem
-- Name: ancient_flames_backon
-- KSNM30
-----------------------------------
package.loaded["scripts/zones/Spire_of_Dem/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Spire_of_Dem/TextIDs");

-----------------------------------
-- EXAMPLE SCRIPT
-- 
-- What should go here:
-- giving key items, playing ENDING cutscenes
--
-- What should NOT go here:
-- Handling of "battlefield" status, spawning of monsters,
-- putting loot into treasure pool, 
-- enforcing ANY rules (SJ/number of people/etc), moving
-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)
print("instance code ");
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function OnBcnmLeave(player,instance,leavecode)
printf("leavecode: %u",leavecode);
	
	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		if(player:getCurrentMission(COP) == THE_MOTHERCRYSTALS)then	
			if(player:hasKeyItem(LIGHT_OF_DEM) == false) then 
				player:addKeyItem(LIGHT_OF_DEM);
				player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_DEM);
			end
			
			if(player:hasKeyItem(LIGHT_OF_MEA) and player:hasKeyItem(LIGHT_OF_HOLLA))then	-- Third promy finished
				player:setVar("PromyvionAccess",2);
				player:setVar("PromathiaStatus",0);
				
				player:startEvent(0x0003,3,1,1,instance:getTimeInside(),1,1,0); 
			elseif(player:hasKeyItem(LIGHT_OF_MEA) or player:hasKeyItem(LIGHT_OF_HOLLA))then -- Second promy finished
				player:startEvent(0x0002,1,1,1,instance:getTimeInside(),1,1,0); 
			else
				player:startEvent(0x0001,1,1,1,instance:getTimeInside(),1,1,0); -- First promy finished
			end
		else
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0); -- Alreday finished this promy
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

	if(csid == 0x0001 or csid == 0x0002)then
		player:setPos(136 ,19 ,220 ,130 ,108);
	elseif(csid==0x0003) then
		player:completeMission(COP,THE_MOTHERCRYSTALS);
		player:addMission(COP,THE_ISLE_OF_FORGOTTEN_SAINTS);
		player:setPos(438 ,0 ,-18 ,11 ,24);
	end

end;