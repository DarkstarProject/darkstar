-----------------------------------
-- Area: Sacrificial Chamber
-- Name: Zilart Mission 4
-- @pos 299 0 349 163
-----------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Sacrificial_Chamber/TextIDs");

-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	local randnum = math.random(1,3);
	local elemental = GetMobByID(17444868 + ((instance:getInstanceNumber() - 1) * 5));

	-- TODO: Pet's magic resistance should probably change.
	if (randnum == 1) then -- Fire
		elemental:changeSkin(32);
		elemental:setSpellList(17);
	elseif (randnum == 2) then -- Water
		elemental:changeSkin(34);
		elemental:setSpellList(15);
	elseif (randnum == 3) then -- Light
		elemental:changeSkin(38);
		elemental:setSpellList(19);
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
		if(player:hasCompletedMission(ZILART,THE_TEMPLE_OF_UGGALEPIH)) then
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

	--[[TODO: This simply fixes the cutscene leaving you at a black screen.
	It does not address @cs 7 and @cs 8 not playing after the victory cutscene.
	Loading those cutscenes onEventFinish also does not work, because of the "walk out" scene at the end.
	
	This is not a proper fix, this is not correct, but players are getting stuck, and it fixes that.]]
	if (csid == 32001 and option == 6) then 
		player:updateEvent(0);
	end
end;

function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
	
	if(csid == 0x7d01) then
		player:addTitle(BEARER_OF_THE_WISEWOMANS_HOPE);
		if(player:hasKeyItem(SACRIFICIAL_CHAMBER_KEY)) then
			player:delKeyItem(SACRIFICIAL_CHAMBER_KEY);
			player:addKeyItem(DARK_FRAGMENT);
			player:messageSpecial(KEYITEM_OBTAINED,DARK_FRAGMENT);
			player:completeMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
			player:addMission(ZILART,HEADSTONE_PILGRIMAGE);
		end
	end
	
end;