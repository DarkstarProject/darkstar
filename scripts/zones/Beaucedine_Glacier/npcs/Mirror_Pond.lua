-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Mirror Pond
-- Involved In Quest: Love And Ice
-- !zone 223
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (npc:getID() == ID.npc.MIRROR_POND_J8) then
        if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.LOVE_AND_ICE) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CARMELOS_SONG_SHEET)) then
            player:startEvent(100);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 100) then
        player:setCharVar("LoveAndIceProgress",1);
        player:delKeyItem(dsp.ki.CARMELOS_SONG_SHEET);
    end
end;
