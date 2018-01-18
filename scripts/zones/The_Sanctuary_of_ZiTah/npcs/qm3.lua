-----------------------------------
-- Area: The Sanctuary of Zitah
-- NPC:  ???
-- Involved In Quest: The Sacred Katana
-- @zone 121
-- !pos -416 0 46
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
require("scripts/zones/The_Sanctuary_of_ZiTah/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS,THE_SACRED_KATANA) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1168,1) and trade:getItemCount() == 1 and not GetMobByID():isSpawned(ISONADE)) then -- Trade Sack of Fish Bait
            player:tradeComplete();
            player:messageSpecial(SENSE_OF_FOREBODING);
            SpawnMob(ISONADE):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    if (player:getVar("IsonadeKilled") == 1) then
        player:setVar("IsonadeKilled",0);
        player:addKeyItem(HANDFUL_OF_CRYSTAL_SCALES);
        player:messageSpecial(KEYITEM_OBTAINED,HANDFUL_OF_CRYSTAL_SCALES);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
