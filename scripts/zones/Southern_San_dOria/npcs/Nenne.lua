-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Nenne
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
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
	Cura = player:getQuestStatus(0,20);
	sanFame = player:getFameLevel(SANDORIA);
	MedicineWoman = player:getQuestStatus(0,30);
    if (Cura == 0 and MedicineWoman == 2 and sanFame >= 3) then
		player:startEvent(0x21A);
		elseif (player:hasKeyItem(154) == true) then
		player:startEvent(0x287);
		else
			player:startEvent(0x248);
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
if (csid == 0x21A) then
	player:addQuest(0,20);
	elseif (csid == 0x287) then
	player:delKeyItem(154);
	player:completeQuest(0,20);
	player:setTitle(53);  		-- "A Moss Kind Person"
	player:addKeyItem(155);	-- A Scroll of Treasure (keyItem)
	player:messageSpecial(6406,155);
	player:addFame(0,SAN_FAME*30);
	end
end;
