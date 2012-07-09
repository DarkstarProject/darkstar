-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Burning Circle
-- @pos -221 -24 19 206
-------------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/QuBia_Arena/TextIDs");
	
	-- 0: The Ruins of Fei'Yin, Darkness Rising, The Final Seal (Rank 5 Mission)
	-- 1: Come Into My Parlor
	-- 2: E-vase-ive Action
	-- 3: Infernal Swarm
	-- 4: The Heir to the Light
	-- 5: Shattering Stars (Paladin)
	-- 6: Shattering Stars (Dark Knight)
	-- 7: Shattering Stars (Bard)
	-- 8: Demolition Squad
	-- 9: Die By the Sword
	-- 10: Let Sleeping Dogs Die
	-- 11: Brothers D'Aurphe
	-- 12: Undying Promise
	-- 13: Factory Rejects
	-- 14: Idol Thoughts
	-- 15: An Awful Autopsy
	-- 16: Celery
	-- 17: Mirror Images
	-- 18: A Furious Finale (Dancer)
	-- 19: Clash of the Comrades
	-- 20: Those Who Lurk in the Shadows (III)
	-- 21: Beyond Infinity

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

	if(npc:getID() == 17621316) then
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;
			if(player:getCurrentMission(BASTOK) == DARKNESS_RISING and player:getVar("MissionStatus") == 2) then
				bcnmFight = bcnmFight + 1;
			
			elseif((player:getMainLvl() >= 50) and (player:getCurrentMission(player:getNation()) == 14) and (player:getVar("MissionStatus") == 11) and (player:hasKeyItem(BURNT_SEAL) == false)) then
			bcnmFight = bcnmFight + 1;
			elseif ((player:getMainLvl() >= 50) and (player:hasPartyEffect(EFFECT_BATTLEFIELD)) and (GetServerVariable("[BF]Mission_5-1_Enter") == 1) and (player:hasCompletedMission(player:getNation(),14))) then
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
		SetServerVariable("[BF]Mission_5-1_Enter",1);

		if(option == 0) then
			local skip = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);
			onTradeFight = player:getVar(tostring(pZone) .. "_onTrade")

			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				--elseif(player:hasCompletedMission(player:getNation(),14)) then
			--		skip = 1;
				--	record = GetServerVariable("[BF]The_Rank_5_Mission_record");
				--	player:levelRestriction(50);
				
				player:updateEvent(2,0,0,record,1,skip);
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
		-- Rank 5-1
		elseif(option == 100) then
			bcnmSpawn(player:getVar(tostring(pZone) .. "_Field"),option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,option,0,900);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_onTrade",0);
			player:setVar(tostring(pZone) .. "_Fight",option);
			--player:levelRestriction(50);
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
		SetServerVariable("[BF]Mission_5-1_Enter",0);
	end
	
end;
