-----------------------------------
-- Area: Bastok Mines
-- NPC:  Trail Markings
-- Dynamis-Bastok Enter
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

-- 0x00c8
-- 1st digit: [1]sandoria [2]bastok [3]windurst [4]jeuno [5]beaucedine [6]xarcabard
-- 4th digit: number of day between 2 dyna
-- 5th digit: number of player allowed
-- 6th digit: keyitem needed
-- 7th digit: Timeless Hourglass
-- 8th digit: Perpetual Hourglass

-- 0x02ad
-- 1st digit: [1]sandoria [2]bastok [3]windurst [4]jeuno [5]beaucedine [6]xarcabard
-- 3rd digit: time ? 
-- 8rd digit: Perpetual Hourglass

-- Finish 8: enter
--player:startEvent(0x00c8,2,0,0,3,64,VIAL_OF_SHROUDED_SAND,4236,4237,0);

function onTrigger(player,npc)
	
	if(player:getVar("Dynamis_Status") == 1) then
		player:startEvent(0x02AE); -- cs with Cornelia
	elseif(player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
		realDay = tonumber(os.date("%j"))
		dynaWaitxDay = player:getVar("dynaWait1Day");
		if(player:getMainLvl() < 65) then
			player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,65);
		elseif(dynaWaitxDay ~= realDay or (dynaWaitxDay == realDay and player:getVar("DynaSandoriaID") == GetServerVariable("[DynaSandoria]UniqueID"))) then
			player:startEvent(0x02ad,1);
		else
			dayRemaining = 24 - tonumber(os.date("%H"));
			player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,1);
		end
	end
	
end; 

-- 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
	
	if(csid == 0x02AE) then
		player:addKeyItem(VIAL_OF_SHROUDED_SAND);
		player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
		player:setVar("Dynamis_Status",0);
	elseif(csid == 0x02ad and option == 0) then
		player:setPos(161.838,-2.000,161.673,93,0xb9);
	end
	
end;