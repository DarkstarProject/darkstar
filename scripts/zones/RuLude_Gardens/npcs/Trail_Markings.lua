-----------------------------------
-- Area: Rulude Gardens
-- NPC:  Trail Markings
-- Dynamis-Jeuno Enter
-----------------------------------
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Rulude_Gardens/TextIDs");

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

-- 0x00c9
-- 1st digit: [1]sandoria [2]bastok [3]windurst [4]jeuno [5]beaucedine [6]xarcabard
-- 3rd digit: time ? 
-- 8rd digit: Perpetual Hourglass

-- Finish 8: enter
--player:startEvent(0x00c8,2,0,0,3,64,VIAL_OF_SHROUDED_SAND,4236,4237,0);

function onTrigger(player,npc)
	
	if(player:getVar("Dynamis_Status") == 1) then
		player:startEvent(0x00CB); -- cs with Cornelia
	elseif(player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
		realDay = tonumber(os.date("%j"))
		dynaWaitxDay = player:getVar("dynaWait1Day");
		if(player:getMainLvl() < 65) then
			player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,65);
		elseif(dynaWaitxDay ~= realDay or (dynaWaitxDay == realDay and player:getVar("DynaJeunoID") == GetServerVariable("[DynaJeunoID]UniqueID"))) then
			player:startEvent(0x271c,4);
		else
			dayRemaining = 24 - tonumber(os.date("%H"));
			player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,4);
		end
	end
	
end; 

-- 0x271b  0x271c  0x271d  0x271e  0x271f  0x2720  0x2721  0x2722  0x2723  0x2724  0x2725  0x2726  0x2727  0x2728  0x2729  0x272a  0x272b  0x272c

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
	
	if(csid == 0x00CB) then
		player:addKeyItem(VIAL_OF_SHROUDED_SAND);
		player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
		player:setVar("Dynamis_Status",0);
	elseif(csid == 0x271c and option == 0) then
		player:setPos(48.930,10.002,-71.032,195,0xBC);
	end
	
end;