-----------------------------------
-- Area: Maze of Shakhrami
-- Quest: Corsair Af1 "Equiped for All Occasions"
-- NPC: Iron Door (Spawn Lost Soul)
-- @pos 247.735 18.499 -142.267 198
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

    if (player:getQuestStatus(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS) == QUEST_ACCEPTED and player:getVar("EquipedforAllOccasions") ==1) then
        SpawnMob(17588706,180):updateClaim(player);
    end
    if (player:getQuestStatus(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS) == QUEST_ACCEPTED and player:getVar("EquipedforAllOccasions") ==2) then
        player:startEvent(0x042)
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

   if (csid == 0x042) then
        player:setVar("EquipedforAllOccasions",3);
        player:addKeyItem(WHEEL_LOCK_TRIGGER);
        player:messageSpecial(KEYITEM_OBTAINED, WHEEL_LOCK_TRIGGER);
    end    
end;
    
