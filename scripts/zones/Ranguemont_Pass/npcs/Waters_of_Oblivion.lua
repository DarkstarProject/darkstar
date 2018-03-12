-----------------------------------
-- Area: Ranguemont Pass
--  NPC: Waters of Oblivion
-- Finish Quest: Painful Memory (BARD AF1)
-- !pos -284 -45 210 166
-----------------------------------
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ranguemont_Pass/TextIDs");
require("scripts/zones/Ranguemont_Pass/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    TrosKilled = player:getVar("TrosKilled");

    if (player:hasKeyItem(MERTAIRES_BRACELET) and
        not GetMobByID(TROS):isSpawned() and
        (TrosKilled == 0 or (os.time() - player:getVar("Tros_Timer")) > 60)
    ) then
        player:messageSpecial(SENSE_OF_FOREBODING);
        SpawnMob(TROS):updateClaim(player);
    elseif (player:hasKeyItem(MERTAIRES_BRACELET) and TrosKilled == 1) then
        player:startEvent(8); -- Finish Quest "Painful Memory"
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 8) then
        if (npcUtil.completeQuest(player, JEUNO, PAINFUL_MEMORY, {item=16766})) then
            player:delKeyItem(MERTAIRES_BRACELET);
            player:setVar("TrosKilled",0);
            player:setVar("Tros_Timer",0);
        end
    end
end;
