-----------------------------------
-- Area: Ranguemont Pass
--  NPC: Waters of Oblivion
-- Finish Quest: Painful Memory (BARD AF1)
-- !pos -284 -45 210 166
-----------------------------------
local ID = require("scripts/zones/Ranguemont_Pass/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    TrosKilled = player:getVar("TrosKilled");

    if (player:hasKeyItem(dsp.ki.MERTAIRES_BRACELET) and
        not GetMobByID(ID.mob.TROS):isSpawned() and
        (TrosKilled == 0 or (os.time() - player:getVar("Tros_Timer")) > 60)
    ) then
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING);
        SpawnMob(ID.mob.TROS):updateClaim(player);
    elseif (player:hasKeyItem(dsp.ki.MERTAIRES_BRACELET) and TrosKilled == 1) then
        player:startEvent(8); -- Finish Quest "Painful Memory"
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 8) then
        if (npcUtil.completeQuest(player, JEUNO, dsp.quest.id.jeuno.PAINFUL_MEMORY, {item=16766})) then
            player:delKeyItem(dsp.ki.MERTAIRES_BRACELET);
            player:setVar("TrosKilled",0);
            player:setVar("Tros_Timer",0);
        end
    end
end;
