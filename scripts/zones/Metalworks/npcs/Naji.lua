-----------------------------------
-- Area: Metalworks
-- NPC: Naji
-- Standard Info NPC
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--The Doorman
	if (player:hasKeyItem(YASINS_SWORD)) then
		player:startEvent(0x02ee);
	else
	player:startEvent(0x02bc);
	end;

end;



--0x02c6  zeruhn mines
--0x02c7  "the chief" and ayame, a letter
--0x02bc  rude default?
--0x02c9  starting 2-3 for windy and sandoria
--0x02ca  ending 2-3
--0x02cb  iron eater join mission
--0x02cd  reminder to go to beadeaux
--0x02d0  next major mission, back from jeuno and on to fei'yin
--0x02d1  acceptance in case previous turned down
--0x03f0
--0x03f1
--0x02f9
--0x02fa
--0x030e
--0x0325
--0x034d
--0x036d
--0x03aa  0x03ab  0x03ac  0x03ad  0x03ae  0x03cb
--0x03c9  0x03ca

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
	if (csid == 0x02ee) then
		player:delKeyItem(YASINS_SWORD);
		player:addItem(16678,1);
		player:messageSpecial(ITEM_OBTAINED, 16678);
		player:completeQuest(BASTOK,THE_DOORMAN);
	else
	end;

--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
