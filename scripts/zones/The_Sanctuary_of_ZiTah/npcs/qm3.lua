-----------------------------------
-- Area: The Sanctuary of Zitah
-- NPC:  ???
-- Involved In Quest: The Sacred Katana
-- !pos -416 0 46 121
-----------------------------------
local ID = require("scripts/zones/The_Sanctuary_of_ZiTah/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS,THE_SACRED_KATANA) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1168,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.ISONADE):isSpawned()) then -- Trade Sack of Fish Bait
            player:tradeComplete();
            player:messageSpecial(ID.text.SENSE_OF_FOREBODING);
            SpawnMob(ID.mob.ISONADE):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    if (player:getVar("IsonadeKilled") == 1) then
        player:setVar("IsonadeKilled",0);
        player:addKeyItem(dsp.ki.HANDFUL_OF_CRYSTAL_SCALES);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.HANDFUL_OF_CRYSTAL_SCALES);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
