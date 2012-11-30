-----------------------------------
-- Area: Windurst Walls
-- NPC:  Trail Markings
-- Dynamis-Windurst Enter
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Walls/TextIDs");

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
		elseif(dynaWaitxDay ~= realDay or (dynaWaitxDay == realDay and player:getVar("DynaWindurstID") == GetServerVariable("[DynaWindurst]UniqueID"))) then
			player:startEvent(0x01c4,3);
		else
			dayRemaining = 24 - tonumber(os.date("%H"));
			player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,3);
		end
	end
	
end; 
-- 0x01c3  0x01c4  0x01c5  0x01c6  0x01c7  0x01c8  0x01c9  0x01ca  0x01cb  0x01cc  0x01cd  0x01ce  0x01cf  0x01d0  0x01d1  0x01d2  0x01d3  0x01d4

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
-- printf("finishRESULT: %u",option);
	
	if(csid == 0x00CB) then
		player:addKeyItem(VIAL_OF_SHROUDED_SAND);
		player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
		player:setVar("Dynamis_Status",0);
	elseif(csid == 0x01c4 and option == 0) then
		player:setPos(-221.988,1.000,-120.184,0,0xbb);
	end
	
end;