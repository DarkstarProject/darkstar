-----------------------------------
-- Area: Garlaige Citadel
--  NPC: qm20 (??? - Bomb Coal Fragments)
-- Involved in Quest: In Defiant Challenge
-- !pos -137.047 0 347.502 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/Garlaige_Citadel/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (OldSchoolG1 == false) then
        if (player:hasItem(1090) == false and player:hasKeyItem(BOMB_COAL_FRAGMENT3) == false
        and player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_ACCEPTED) then
            player:addKeyItem(BOMB_COAL_FRAGMENT3);
            player:messageSpecial(KEYITEM_OBTAINED,BOMB_COAL_FRAGMENT3);
        end

        if (player:hasKeyItem(BOMB_COAL_FRAGMENT1) and player:hasKeyItem(BOMB_COAL_FRAGMENT2) and player:hasKeyItem(BOMB_COAL_FRAGMENT3)) then
            if (player:getFreeSlotsCount() >= 1) then
                player:addItem(1090, 1);
                player:messageSpecial(ITEM_OBTAINED, 1090);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1090);
            end
        end

        if (player:hasItem(1090)) then
            player:delKeyItem(BOMB_COAL_FRAGMENT1);
            player:delKeyItem(BOMB_COAL_FRAGMENT2);
            player:delKeyItem(BOMB_COAL_FRAGMENT3);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;