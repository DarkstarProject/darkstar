-----------------------------------
-- Area: Bastok Mines
-- NPC:  Trail Markings
-- Dynamis-Bastok Enter
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Bastok_Mines/TextIDs");

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
	
--	if(player:getVar("Dynamis_Status") == 1) then
--		player:startEvent(0x00CB); -- cs with Cornelia
--	elseif(player:hasKeyItem(VIAL_OF_SHROUDED_SAND) and player:getVar("dynaWait1Day") ~= tonumber(os.date("%j"))) then
		player:startEvent(0x00c9,2);
--	end
	
end; 

-- 0x00c8 Menu creation du perpetual et information
-- 0x00c9 Menu entrer dans dyna
-- 0x00ca CS explication de comment obtenir le sablier (longue)
-- 0x00cb CS explication de comment obtenir le sablier (courte)
-- 0x00cc pareil
-- 0x00cd pareil
-- 0x00d0 cs corneilia/francmage qui impregne le sablier
-- 0x00d1 cs corneilia/ulrich
-- 0x00d2 cs corneilia/iru-kuiru
-- 0x00d3 
-- 0x00d4 
-- 0x00d5 
-- 0x00d6 
-- 0x00d7 
-- 0x00d8 
-- 0x00d9 
-- 0x00da 
-- 0x00db

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
	elseif(csid == 0x00c9 and option == 0) then
		player:setPos(116.482,0.994,-72.121,128,0xba);
	end
	
end;