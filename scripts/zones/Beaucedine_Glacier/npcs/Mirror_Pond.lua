-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Mirror Pond
-- Involved In Quest: Love And Ice
-- !zone 223
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beaucedine_Glacier/TextIDs");
require("scripts/zones/Beaucedine_Glacier/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (npc:getID() == MIRROR_POND_J8) then
        if (player:getQuestStatus(BASTOK,LOVE_AND_ICE) == QUEST_ACCEPTED and player:hasKeyItem(CARMELOS_SONG_SHEET)) then
            player:startEvent(100);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 100) then
        player:setVar("LoveAndIceProgress",1);
        player:delKeyItem(CARMELOS_SONG_SHEET);
    end
end;
