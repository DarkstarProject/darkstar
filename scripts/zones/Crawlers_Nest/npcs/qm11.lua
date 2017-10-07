-----------------------------------
-- Area: Crawlers' Nest
--  NPC: qm11 (??? - Exoray Mold Crumbs)
-- Involved in Quest: In Defiant Challenge
-- !pos 98.081 -38.75 -181.198 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/Crawlers_Nest/TextIDs");

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
        if (player:hasItem(1089) == false and player:hasKeyItem(EXORAY_MOLD_CRUMB2) == false
        and player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_ACCEPTED) then
            player:addKeyItem(EXORAY_MOLD_CRUMB2);
            player:messageSpecial(KEYITEM_OBTAINED,EXORAY_MOLD_CRUMB2);
        end

        if (player:hasKeyItem(EXORAY_MOLD_CRUMB1) and player:hasKeyItem(EXORAY_MOLD_CRUMB2) and player:hasKeyItem(EXORAY_MOLD_CRUMB3)) then
            if (player:getFreeSlotsCount() >= 1) then
                player:addItem(1089, 1);
                player:messageSpecial(ITEM_OBTAINED, 1089);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1089);
            end
        end

        if (player:hasItem(1089)) then
            player:delKeyItem(EXORAY_MOLD_CRUMB1);
            player:delKeyItem(EXORAY_MOLD_CRUMB2);
            player:delKeyItem(EXORAY_MOLD_CRUMB3);
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