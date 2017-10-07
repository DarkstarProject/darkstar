-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: qm8 (??? - Ancient Papyrus Shreds)
-- Involved in Quest: In Defiant Challenge
-- !pos 105.275 -32 92.551 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (OldSchoolG1 == false) then
        if (player:hasItem(1088) == false and player:hasKeyItem(ANCIENT_PAPYRUS_SHRED2) == false
        and player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_ACCEPTED) then
            player:addKeyItem(ANCIENT_PAPYRUS_SHRED2);
            player:messageSpecial(KEYITEM_OBTAINED,ANCIENT_PAPYRUS_SHRED2);
        end

        if (player:hasKeyItem(ANCIENT_PAPYRUS_SHRED1) and player:hasKeyItem(ANCIENT_PAPYRUS_SHRED2) and player:hasKeyItem(ANCIENT_PAPYRUS_SHRED3)) then
            if (player:getFreeSlotsCount() >= 1) then
                player:addItem(1088, 1);
                player:messageSpecial(ITEM_OBTAINED, 1088);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1088);
            end
        end

        if (player:hasItem(1088)) then
            player:delKeyItem(ANCIENT_PAPYRUS_SHRED1);
            player:delKeyItem(ANCIENT_PAPYRUS_SHRED2);
            player:delKeyItem(ANCIENT_PAPYRUS_SHRED3);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;