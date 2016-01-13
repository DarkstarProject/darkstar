-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: qm9 (??? - Ancient Papyrus Shreds)
-- Involved in Quest: In Defiant Challenge
-- @pos 92.272 -32 -64.676 195
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
local text = require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

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
        if (player:hasItem(1088) == false and player:hasKeyItem(ANCIENT_PAPYRUS_SHRED3) == false
        and player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_ACCEPTED) then
            player:addKeyItem(ANCIENT_PAPYRUS_SHRED3);
            player:messageSpecial(text.KEYITEM_OBTAINED,ANCIENT_PAPYRUS_SHRED3);
        end

        if (player:hasKeyItem(ANCIENT_PAPYRUS_SHRED1) and player:hasKeyItem(ANCIENT_PAPYRUS_SHRED2) and player:hasKeyItem(ANCIENT_PAPYRUS_SHRED3)) then
            if (player:getFreeSlotsCount() >= 1) then
                player:addItem(1088, 1);
                player:messageSpecial(text.ITEM_OBTAINED, 1088);
            else
                player:messageSpecial(text.ITEM_CANNOT_BE_OBTAINED, 1088);
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