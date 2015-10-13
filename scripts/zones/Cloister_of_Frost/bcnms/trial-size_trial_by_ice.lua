-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial-size Trial by Ice
-- @pos 558 0.1 596 203
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Frost/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Cloister_of_Frost/TextIDs");

-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
-- print("leave code "..leavecode);
	
	if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
	elseif (leavecode == 4) then
		player:setVar("TrialSizeIce_date",tonumber(os.date("%j"))); -- If you loose, you need to wait 1 real day
		player:startEvent(0x7d02);
	end
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
	
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
	
	if (csid == 0x7d01) then
		if (player:hasSpell(302) == false) then
			player:addSpell(302); -- Shiva
			player:messageSpecial(SHIVA_UNLOCKED,0,0,4);
		end
		if (player:hasItem(4181) == false) then
			player:addItem(4181);
			player:messageSpecial(ITEM_OBTAINED,4181); -- Scroll of instant warp
		end
		player:setVar("TrialSizeIce_date", 0);
		player:addFame(SANDORIA,SAN_FAME*30);
		player:completeQuest(SANDORIA,TRIAL_SIZE_TRIAL_BY_ICE);
	end
	
end;