-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Atelloune
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
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	-----lady bug
	if (player:getQuestStatus(0,114) == 1) then
	count = trade:getItemCount();
		carta = trade:hasItemQty(2506, 1);
		gil = trade:getGil();
		if (carta and count == 1 and gil == 0) then
			player:startEvent(0x037b);
			end
			end
			end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	Bug = player:getQuestStatus(0,114)
sanFame = player:getFameLevel(SANDORIA);	
	if (Bug == 0 and sanFame >= 2) then
	player:startEvent(0x037a);
	elseif (Bug == 1) then
	player:startEvent(0x037c);
	elseif (Bug == 2) then
	player:startEvent(0x0374);
	elseif (sanFame < 2) then
	player:startEvent(0x037c);
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
if (csid == 0x037a) then
player:addQuest(0,114);
player:getQuestStatus(0,114);
end
if (csid == 0x037b) then
player:completeQuest(0,114);
player:addFame(SANDORIA,SAN_FAME*30);
player:addItem(15008,1);
player:messageSpecial(6403,15008);
end
end;




