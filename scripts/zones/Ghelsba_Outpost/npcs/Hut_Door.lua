-----------------------------------
-- Area: Ghelsba Outpost
-- NPC:  Hut Door
-- Involved in Quest: The Holy Crest
-- @zone 140
-- @pos -162 -11 78
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/bcnm");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Ghelsba_Outpost/TextIDs");

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
	
	if(getAvailableBattlefield(pZone) ~= 255) then
		local bcnmFight = 0;
		
		if(player:hasKeyItem(DRAGON_CURSE_REMEDY)) then
			bcnmFight = bcnmFight + 2;
		end
		
		if(bcnmFight >= 0) then
			player:startEvent(0x7d00,0,0,0,bcnmFight);
		end
	else
		player:messageSpecial(YOU_CANNOT_ENTER_THE_BATTLEFIELD);
	end
	
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
			local bcnmFight = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);
			
			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				player:updateEvent(2,1,0,100,6,0);
			else
				player:updateEvent(0,0,0,0,0,0);
			end
		elseif(option == 255) then
			player:setVar(tostring(pZone) .. "_Field",readyField);
		end
	end
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	pZone = player:getZone();
	
	if(csid == 0x7d00 and option ~= 1073741824 and option ~= 0) then
		if(option == 35) then
			player:startEvent(0x7d02);
		else
			bcnmSpawn(player:getVar(tostring(pZone) .. "_Field"),option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,option,0,1800,0);
			player:setVar("TheHolyCrest_Timer", os.time());
			player:setVar(tostring(pZone) .. "_Fight",option);
		end
	end
	
end;