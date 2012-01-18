-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Sobane
-- Starts and Finishes Quest: Signed in Blood
-- Involved in quest: Sharpening the Sword
-- @zone 230
-- @pos  -190 -2 97
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	signedInBlood = player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD);
	
	if(signedInBlood == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
		player:startEvent(0x02dc,0,1662); -- Start Quest "Father and Son"
	elseif(player:getVar("sharpeningTheSwordCS") >= 2) then
		player:startEvent(0x0034);
	end
end; 

-- 0x0034  0x02dc  0x02dd  0x02de  0x02df  0x02e0  0x02e1  0x02e2  0x02e3  0x02e4  0x02e5

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
	if(csid == 0x02dc and option == 1) then
		player:addQuest(SANDORIA,SIGNED_IN_BLOOD);
	elseif(csid == 0x0034) then
		player:setVar("sharpeningTheSwordCS",3);
	end
end;




