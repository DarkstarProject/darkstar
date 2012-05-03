-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Mahogany Door
-- @pos 299 0 349 163
-------------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/status");
require("scripts/globals/missions");
require("scripts/zones/Sacrificial_Chamber/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	pZone = player:getZone();
	player:setVar(tostring(pZone) .. "_Ready",0);
	player:setVar(tostring(pZone) .. "_Field",0);

	if(npc:getID() == 17444945) then
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;

			if(player:hasKeyItem(SACRIFICIAL_CHAMBER_KEY)) then
				bcnmFight = bcnmFight + 1;
			end

			if(bcnmFight >= 0) then
				player:startEvent(0x7d00,0,0,0,bcnmFight,0,0,0,0);
			end
		else
			player:messageSpecial(7155);
		end
	else
		player:startEvent(0x7d03);
	end
	
	return 1;
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);

	if(csid == 0x7d00) then
		pZone = player:getZone();
		zoneReady = tostring(pZone) .. "_Ready";
		readyField = getAvailableBattlefield(pZone);

		if(option == 0) then
			local skip = 0;
			local bcnmFight = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);
			
			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				if(player:hasKeyItem(SACRIFICIAL_CHAMBER_KEY)) then
					--bcnmFight = 1;
					record = GetServerVariable("[BF]Zilart_Mission_4_record");
				elseif(player:hasCompletedMission(ZILART,THE_TEMPLE_OF_UGGALEPIH)) then
					skip = 1; --bcnmFight = 1;
					record = GetServerVariable("[BF]Zilart_Mission_4_record");
				end
				player:updateEvent(2,bcnmFight,0,record,6,skip);
			else
				player:updateEvent(0,0,0,0,0,0);
			end
		elseif(option == 255) then
			player:setVar(tostring(pZone) .. "_Field",readyField);
		end
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
printf("onFinish RESULT: %u",option);

	pZone = player:getZone();

	if(csid == 0x7d00 and option ~= 1073741824 and option ~= 0) then
		if(option == 3) then
			player:startEvent(0x7d02);
		else
			bcnmSpawn(player:getVar(tostring(pZone) .. "_Field"),option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,option - 99,0,900,0);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_Fight",option);
		end
	elseif(csid == 0x7d03 and option == 4) then
		if(player:getVar(tostring(pZone) .. "_Fight") == 100) then
			player:setVar("BCNM_Killed",0);
			player:setVar("BCNM_Timer",0);
		end
		player:setVar(tostring(pZone) .. "_Runaway",1);
		player:delStatusEffect(EFFECT_BATTLEFIELD);
		player:setVar(tostring(pZone) .. "_Runaway",0)
	end
	
end;