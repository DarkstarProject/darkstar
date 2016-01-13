-----------------------------------
-- Area: Lower Jeuno
--  NPC: Amalasanda
-- Type: Tenshodo Merchant
-- @pos 28.149 2.899 -44.780 245
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/keyitems");
local text = require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(TENSHODO_MEMBERS_CARD)) then 
        if (player:sendGuild(60416,1,23,1)) then
            player:showText(npc, text.AMALASANDA_SHOP_DIALOG);
        end
    else
        -- player:startEvent(0x0096);
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

