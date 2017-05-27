-----------------------------------
-- Area: Windurst Waters
-- NPC:  Chomo Jinjahl
-- Guild Merchant NPC: Cooking Guild
-- @pos -105.094 -2.222 73.791 238
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
local TextIDs = require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(5302,5,20,7)) then
        player:showText(npc,TextIDs.CHOMOJINJAHL_SHOP_DIALOG);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
