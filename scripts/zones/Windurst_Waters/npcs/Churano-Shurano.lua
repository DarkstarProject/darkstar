-----------------------------------
-- Area: Windurst Waters
--  NPC: Churano-Shurano
-- Working 100%
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.MAGICKED_ASTROLABE) == false) then
        local cost = 10000;
        if (player:getCharVar("Astrolabe") == 0) then
            player:startEvent(1080, cost);
        else
            player:startEvent(1081, cost);
        end
    else
        player:startEvent(280);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1080 and option == 1) then
        player:setCharVar("Astrolabe", 1);
    elseif (csid == 1081 and option == 1 and player:delGil(10000)) then
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAGICKED_ASTROLABE);
        player:addKeyItem(dsp.ki.MAGICKED_ASTROLABE);
    end
end;
