-----------------------------------
-- Area: Port San d'Oria
-- NPC: Vounebariont
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Think_Shells"
Thick = player:getQuestStatus(SANDORIA, THICK_SHELLS);

	if (Thick == 0 or Thick == 1 or Thick == 2) then
		count = trade:getItemCount();
		beetle = trade:hasItemQty(889, 5);
		if (count == 5 and beetle) then
		player:tradeComplete();
		if (Thick == 0) then
		player:addFame(SANDORIA,SAN_FAME*30);
		player:completeQuest(THICK_SHELLS);
		player:setTitle(BUG_CATCHER);
		player:startEvent(0x0202);
        elseif (Thick == 1 or Thick == 2) then
		player:addFame(SANDORIA,SAN_FAME*5);
		player:startEvent(0x0202);
		end
end		
		
		end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	sanFame = player:getFameLevel(SANDORIA);
	print(player:getFameLevel(SANDORIA));
Thick = player:getQuestStatus(SANDORIA, THICK_SHELLS);
if (Thick == 0 and sanFame >= 2) then
player:startEvent(0x0204);
player:addQuest(SANDORIA, THICK_SHELLS);
elseif (Thick == 1 and sanFame >= 2) then
player:startEvent(0x0204);
player:addQuest(SANDORIA, THICK_SHELLS);
elseif (Thick == 2 and sanFame >= 2) then
player:startEvent(0x0204);
player:addQuest(SANDORIA, THICK_SHELLS);
elseif (Thick == 0 and sanFame < 2) then
player:startEvent(0x0238);
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
if (csid == 0x0202) then
player:addGil(750);
player:messageSpecial(GIL_OBTAINED,750)
end
end;