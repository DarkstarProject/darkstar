-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Maat
-- Starts and Finishes Quest: In Defiant Challenge
-- Involved in Quests: Beat Around the Bushin
-- @zone 243
-- @pos 
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("BeatAroundTheBushin") == 5) then
		player:startEvent(0x0075);
	end
end;

-- 0x0075  0x004f  0x0050  0x0051  0x0052  0x0053  0x0054  0x0055  0x0056  0x0057  0x0058  0x0059  0x005a  0x005c  0x005b  
-- 0x0040  0x003e  0x003f  0x005d  0x004e  0x005e  0x004a  0x273d  0x2798  0x2799  0x27b1
-- 0x004f  0x0051  0x0052  0x0054  0x0055  0x0057  0x0058  0x0059  0x005a  0x005c  0x0040  0x005d  0x004a  0x0075  0x2798  
-- 0x2799  0x27b1  0x2793  0x2794

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if(csid == 0x0075) then
		player:setVar("BeatAroundTheBushin",6);
	end
end;



