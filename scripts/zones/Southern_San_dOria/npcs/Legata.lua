-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Legata
--  General Info NPC
-------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
Flint = player:getQuestStatus(0,77);
if (Flint == 1 or Flint == 2) then
	count = trade:getItemCount();
		carta = trade:hasItemQty(768, 4);
		gil = trade:getGil();
		if (carta and count == 4 and gil == 0) then
			player:startEvent(0x0024);
			end
			end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
Flint = player:getQuestStatus(0,77);
if (Flint == 0) then
	player:startEvent(0x0025);
	elseif (Flint == 1) then
	player:startEvent(0x0023);
	elseif (Flint == 2) then
	player:startEvent(0x0023);
	end
end; 

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
Flint = player:getQuestStatus(0,77);
if (csid == 0x0025) then
player:addQuest(0,77);
elseif (csid == 0x0024) then
if (Flint == 1) then
player:completeQuest(0,77);
player:addFame(SANDORIA,SAN_FAME*30);
player:tradeComplete();
player:addGil(GIL_RATE*100);
player:messageSpecial(6404,GIL_RATE*100)
elseif (csid == 0x0024) then
if (Flint == 2) then
player:addFame(SANDORIA,SAN_FAME*5);
player:tradeComplete();
player:addGil(GIL_RATE*100);
player:messageSpecial(6404,GIL_RATE*100)
end
end
end
end;





