-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ???
-- Involved in Quest: Knight Stalker
-- !pos 58 1 -70 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/pets");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (
        player:getVar("KnightStalker_Progress") == 4 and
        player:getVar("KnightStalker_Kill") == 0 and
        player:getMainJob() == JOBS.DRG and
        player:getPetID() == PET_WYVERN and
        not GetMobByID(CLEUVARION_M_RESOAIX):isSpawned() and
        not GetMobByID(ROMPAULION_S_CITALLE):isSpawned()
    ) then
        -- These mobs specifically will not engage unless aggro'd.
        player:messageSpecial(SOME_SORT_OF_CEREMONY + 1); -- Your wyvern reacts violently to this spot!
        SpawnMob(CLEUVARION_M_RESOAIX);
        SpawnMob(ROMPAULION_S_CITALLE);
    elseif (NM_Kill == 1) then
        player:startEvent(67);
    else
        player:messageSpecial(SOME_SORT_OF_CEREMONY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 67) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12519);
        else
            player:addItem(12519);
            player:messageSpecial(ITEM_OBTAINED,12519); -- Drachen Armet
            player:addFame(SANDORIA,AF3_FAME);
            player:addTitle(PARAGON_OF_DRAGOON_EXCELLENCE);
            player:delKeyItem(CHALLENGE_TO_THE_ROYAL_KNIGHTS);
            player:setVar("KnightStalker_Option1",1); -- Optional post-quest cutscenes.
            player:setVar("KnightStalker_Option2",1);
            player:setVar("KnightStalker_Kill",0);
            player:setVar("KnightStalker_Progress",0);
            player:completeQuest(SANDORIA,KNIGHT_STALKER);
        end
    end
end;
