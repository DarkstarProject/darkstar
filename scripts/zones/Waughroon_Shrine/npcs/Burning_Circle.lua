-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Burning Circle
-- Waughroon Shrine Burning Circle
-- @pos -345 104 -260 144
-------------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Waughroon_Shrine/TextIDs");

	---- 0: Rank 2 Final Mission for Bastok "The Emissary" and Sandy "Journey Abroad"
	---- 1: Worms Turn
	---- 2: Grimshell Shocktroopers
	---- 3: On my Way
	---- 4: Thief in Norg
	---- 5: 3, 2, 1
	---- 6: Shattering Stars (RDM)
	---- 7: Shattering Stars (THF)
	---- 8: Shattering Stars (BST)
	---- 9: 
	---- 10: 
	---- 11: 
	---- 12: 
	---- 13: 
	---- 14: 
	---- 15: 
	---- 16: 
	---- 17: 

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(TradeBCNM(player,player:getZone(),trade,npc))then
		return;
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:setVar("trade_bcnmid",0);
	
	if(EventTriggerBCNM(player,npc))then
		return;
	end
	
	pZone = player:getZone();
	player:setVar(tostring(pZone) .. "_Ready",0);
	player:setVar(tostring(pZone) .. "_Field",0);
	
	if(npc:getID() == 17367339) then
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;

			if((player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 or 
			   player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK2) and player:getVar("MissionStatus") == 10) then
				bcnmFight = bcnmFight + 1;
			end

			if(bcnmFight >= 0) then
				player:startEvent(0x7d00,0,0,0,bcnmFight,0,0,0,0);
			end
		else
			player:messageSpecial(7155);
		end
	else
		player:startEvent(0x7d02);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if(EventUpdateBCNM(player,csid,option))then
		return;
	end
	
	if(csid == 0x7d00) then
		pZone = player:getZone();
		zoneReady = tostring(pZone) .. "_Ready";
		readyField = getAvailableBattlefield(pZone);

		if(option == 0) then
			local skip = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);
			onTradeFight = player:getVar(tostring(pZone) .. "_onTrade")

			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				if(onTradeFight ~= 0) then
					bcnmFight = getUpdateFightBCNM(player,pZone,onTradeFight);
					record = GetServerVariable("[BF]Shattering_Stars_job"..player:getMainJob().."_record");
				elseif((player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 or 
					   player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK2) and player:getVar("MissionStatus") == 10) then
					record = GetServerVariable("[BF]Mission_2-3_Waughroon_record");
					player:levelRestriction(25);
				elseif(player:hasCompletedMission(player:getNation(),5)) then
					skip = 1;
					record = GetServerVariable("[BF]Mission_2-3_Waughroon_record");
					player:levelRestriction(25);
				end
				
				player:updateEvent(2,bcnmFight,0,record,1,skip);
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
--printf("onFinish RESULT: %u",option);
	
	if(EventFinishBCNM(player,csid,option))then
		return;
	end
	
	pZone = player:getZone();

	if(csid == 0x7d00 and option ~= 1073741824 and option ~= 0) then
		if(option == 3) then
			player:startEvent(0x7d02);
		else
			bcnmSpawn(player:getVar(tostring(pZone) .. "_Field"),option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,option,0,900);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_onTrade",0);
			player:setVar(tostring(pZone) .. "_Fight",option);
		end
	elseif(csid == 0x7d03 and option == 4) then
		if(player:getVar(tostring(pZone) .. "_Fight") == 100) then
			player:setVar("BCNM_Killed",0);
			player:setVar("BCNM_Timer",0);
		end
		player:setVar(tostring(pZone) .. "_Runaway",1);
		player:delStatusEffect(EFFECT_BATTLEFIELD);
		player:levelRestriction(0);
		player:setVar(tostring(pZone) .. "_Runaway",0)
	end
	
end;