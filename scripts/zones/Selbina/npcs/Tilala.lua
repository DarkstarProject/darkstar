-----------------------------------
-- Area: Selbina
--  NPC: Tilala
-- Guild Merchant NPC: Clothcrafting Guild 
-- @pos 14.344 -7.912 10.276 248
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
local text = require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(516,6,21,0)) then
        player:showText(npc, text.CLOTHCRAFT_SHOP_DIALOG);
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
