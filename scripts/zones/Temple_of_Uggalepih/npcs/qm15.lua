-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Knight Stalker Quest)
-- @pos 58 1 -70 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local NM_Kill = player:getVar("KnightStalker_Kill");
	if (player:getVar("KnightStalker_Progress") == 4 and player:getMainJob() == 14 and player:getPetID() == 48 and NM_Kill == 0) then
		-- These mobs specifically will not engage unless aggro'd.
		player:messageSpecial(SOME_SORT_OF_CEREMONY + 1); -- Your wyvern reacts violently to this spot!
		SpawnMob(17428807,180);
		SpawnMob(17428808,180);
	elseif (NM_Kill == 1) then
		player:startEvent(67);
	else
		player:messageSpecial(SOME_SORT_OF_CEREMONY);
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
	if(csid == 67) then
		player:addItem(12519);
		player:messageSpecial(ITEM_OBTAINED,12519); -- Drachen Armet
		player:addFame(SANDORIA,AF3_FAME*SAN_FAME);
		player:addTitle(PARAGON_OF_DRAGOON_EXCELLENCE);
		player:delKeyItem(CHALLENGE_TO_THE_ROYAL_KNIGHTS);
		player:setVar("KnightStalker_Option1",1); -- Optional post-quest cutscenes.
		player:setVar("KnightStalker_Option2",1);
		player:completeQuest(SANDORIA,KNIGHT_STALKER);
	end
end;