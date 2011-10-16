-----------------------------------
-- Area: Davoi
-- NPC: Hide Flap
-- Involved in Quest: The Doorman
-----------------------------------

require("scripts/globals/keyitems");
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------




function onTrigger(player,npc)

GKILLERVAR = player:getVar("GKILLER");
BKILLERVAR = player:getVar("BKILLER");

--if 	player:getQuestStatus(BASTOK,THE_DOORMAN ==0) or player:getQuestStatus(BASTOK,THE_DOORMAN ==2)  then
		if (player:getQuestStatus(BASTOK,THE_DOORMAN) ==1 and (GetMobAction(BARAKBOK) == 0) and (GetMobAction(GAVOTVUT) == 0) and GKILLERVAR ==0 and BKILLERVAR ==0) then
			SpawnMob(GAVOTVUT);
			SpawnMob(BARAKBOK);
		elseif (player:getQuestStatus(BASTOK,THE_DOORMAN ==1) and GKILLERVAR ==1 and BKILLERVAR ==1 and player:hasKeyItem(SWORD_GRIP_MATERIAL) == false) then
			player:addKeyItem(SWORD_GRIP_MATERIAL)
			player:messageSpecial(KEYITEM_OBTAINED, SWORD_GRIP_MATERIAL);
		else
			end;
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
end;
