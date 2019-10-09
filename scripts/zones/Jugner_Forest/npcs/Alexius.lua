-----------------------------------
-- Area: Jugner Forest
--  NPC: Alexius
--  Involved in Quest: A purchase of Arms & Sin Hunting
-- !pos  105 1 382 104
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
local ID = require("scripts/zones/Jugner_Forest/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local SinHunting = player:getCharVar("sinHunting");    -- RNG AF1

    if (player:hasKeyItem(dsp.ki.WEAPONS_ORDER) == true) then
        player:startEvent(5);
    elseif (SinHunting == 3) then
        player:startEvent(10);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 5) then
        player:delKeyItem(dsp.ki.WEAPONS_ORDER);
        player:addKeyItem(dsp.ki.WEAPONS_RECEIPT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WEAPONS_RECEIPT);
    elseif (csid == 10) then
        player:setCharVar("sinHunting",4);
    end
end;