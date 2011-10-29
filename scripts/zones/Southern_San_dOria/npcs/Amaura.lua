-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Amaura
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
MalboroVine = 1013;
ZincOre = 642;
InsectWing = 846;
AmurasFormula = 0x0094;
ColdMedicine = 0x0093;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
MalboroVine = 1013;
ZincOre = 642;
InsectWing = 846;
AmurasFormula = 0x0094;
ColdMedicine = 0x0093;
MedicineWoman = player:getQuestStatus(0,30);
if (MedicineWoman == QUEST_ACCEPTED) then
count = trade:getItemCount();
		if (count and trade:hasItemQty(MalboroVine,1) == true and trade:hasItemQty(ZincOre,1) == true and trade:hasItemQty(InsectWing,1) == true and count == 3 and player:getQuestStatus(0,30) == 1) then
		player:tradeComplete();
		player:startEvent(0x027D);
		end
		end
		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
MalboroVine = 1013;
ZincOre = 642;
InsectWing = 846;
AmurasFormula = 0x0094;
ColdMedicine = 0x0093;
MedicineWoman = player:getQuestStatus(0,30);
	if (MedicineWoman == 1 and player:hasKeyItem(0x0094) == false and player:hasKeyItem(0x0093) == false) then
		player:startEvent(0x027C);
		elseif (MedicineWoman == 1 and player:hasKeyItem(0x0094) == true and player:hasKeyItem(0x0093) == false) then
		player:startEvent(0x03bc);
		elseif (MedicineWoman == 1 and player:hasKeyItem(0x0094) == false and player:hasKeyItem(0x0093) == true) then
		player:startEvent(0x0282);
		elseif (MedicineWoman == 2) then
		player:startEvent(0x0282);
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
MalboroVine = 1013;
ZincOre = 642;
InsectWing = 846;
AmurasFormula = 0x0094;
ColdMedicine = 0x0093;
	if (csid == 0x027C) then
		player:addKeyItem(148);
		player:messageSpecial(6406,148);
			elseif (csid == 0x027D) then
		player:delKeyItem(AmurasFormula);
		player:addKeyItem(ColdMedicine);
		player:messageSpecial(6406,147);
end
end;