-----------------------------------
-- Area: Throne Room
-- Name: Mission 5-2
-- @pos -111 -6 0 165
-----------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Throne_Room/TextIDs");

-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)

	--[[initialize the HP table.  need to check so we don't overwrite
		someone else who's in the fight!]]
	if(ShadowLordHPTable == nil) then
		ShadowLordHPTable = {};
		ShadowLordHPTable[17453059] = {};
		ShadowLordHPTable[17453058] = {};
		ShadowLordHPTable[17453057] = {};
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
		if(player:hasCompletedMission(player:getNation(),15)) then
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,1);
		else
			player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
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
	
	if(csid == 0x7d01) then
		if(player:getCurrentMission(player:getNation()) == 15) then
			player:addMission(ZILART,THE_NEW_FRONTIER);
			player:addKeyItem(SHADOW_FRAGMENT);
			player:messageSpecial(KEYITEM_OBTAINED,SHADOW_FRAGMENT);
			player:setVar("MissionStatus",3);
		end
		-- You will be transported back to the entrance of Castle Zvahl Baileys
		player:setPos(378.222,-12,-20.299,125,0xA1);
	end
	
end;