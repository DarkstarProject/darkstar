-----------------------------------
-- Area: The Boyahda Tree
-- NPC: qm2 (???)
-- Involved in Quest: Searching for the Right Words
-- !pos 34.651 -20.183 -61.647 153
-----------------------------------
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Boyahda_Tree/TextIDs");
require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Notes: does ??? depop when Agas is spawned?
    -- current implementation: when Agas is active, triggering ??? will result in detarget

    local SearchingForWords = player:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS);
    local zoneHour = VanadielHour();
    local zoneMinute = VanadielMinute();
    local correctTime = zoneHour >= 19 or zoneHour < 4 or (zoneHour == 4 and zoneMinute == 0);

    if (not GetMobByID(AGAS):isSpawned()) then
        if (player:hasKeyItem(MOONDROP)) then
            player:messageSpecial(CAN_SEE_SKY);

        elseif (SearchingForWords == QUEST_ACCEPTED) then

            if (IsMoonNew() or not correctTime) then
                player:messageSpecial(CANNOT_SEE_MOON);

            elseif (player:getVar("Searching_AgasKilled") == 1) then
                player:startEvent(14);

            else
                player:messageSpecial(SOMETHING_NOT_RIGHT);
                SpawnMob(AGAS):updateClaim(player); --missing repop timer for Agas due to errors with SpawnMob
            end

        else
            player:messageSpecial(CAN_SEE_SKY);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 14) then
        player:addKeyItem(MOONDROP);
        player:messageSpecial(KEYITEM_OBTAINED, MOONDROP);
        player:setVar("Searching_AgasKilled", 0);
    end
end;
