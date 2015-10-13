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
require("scripts/globals/teleports");
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
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	print("instance code ");
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
	-- printf("leavecode: %u",leavecode);

	if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		if (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS) then	
			if (player:hasKeyItem(LIGHT_OF_MEA) and player:hasKeyItem(LIGHT_OF_HOLLA)) then 
				player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,0,3);
			elseif (player:hasKeyItem(LIGHT_OF_MEA) or player:hasKeyItem(LIGHT_OF_HOLLA)) then 
				player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,0,2); 
			end
		elseif (player:getCurrentMission(COP) == BELOW_THE_ARKS) then
			    player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,0,1); 
		else
			player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,1); -- can't tell which cs is playing when you're doing it again to help 
		end
	elseif (leavecode == 4) then
		player:startEvent(0x7d02);
	end

end;

function onEventUpdate(player,csid,option)
	-- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
	-- print("bc finish csid "..csid.." and option "..option);

	if (csid == 0x7D01) then
		if (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS) then 
			if (player:hasKeyItem(LIGHT_OF_MEA) and player:hasKeyItem(LIGHT_OF_HOLLA)) then
				player:addExp(1500);
			    player:addKeyItem(LIGHT_OF_DEM);
			    player:messageSpecial(CANT_REMEMBER,LIGHT_OF_DEM);
			    player:completeMission(COP,THE_MOTHERCRYSTALS);
				player:setVar("PromathiaStatus",0)
			    player:addMission(COP,AN_INVITATION_WEST);
			    player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_LUFAISE,0,1);
			elseif (not(player:hasKeyItem(LIGHT_OF_DEM))) then
				player:setVar("cspromy3",1)
			    player:addKeyItem(LIGHT_OF_DEM);
				player:addExp(1500);
			    player:messageSpecial(CANT_REMEMBER,LIGHT_OF_DEM);
			    player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_EXITPROMDEM,0,1);
			end
		elseif (player:getCurrentMission(COP) == BELOW_THE_ARKS) then
			player:addExp(1500);
			player:completeMission(COP,BELOW_THE_ARKS);
			player:addMission(COP,THE_MOTHERCRYSTALS)
			player:setVar("cspromy2",1)
			player:setVar("PromathiaStatus",0)
			player:addKeyItem(LIGHT_OF_DEM);
			player:messageSpecial(CANT_REMEMBER,LIGHT_OF_DEM);
			player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_EXITPROMDEM,0,1);
		else
			player:addExp(1500);
			player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_EXITPROMDEM,0,1);
		end
	end
end;