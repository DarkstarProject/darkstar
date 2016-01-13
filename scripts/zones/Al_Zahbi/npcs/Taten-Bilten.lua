-----------------------------------
-- Area: Al Zahbi
--  NPC: Taten-Bilten
-- Guild Merchant NPC: Clothcraft Guild
-- @pos 71.598 -6.000 -56.930 48
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
local text = require("scripts/zones/Al_Zahbi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(60430,6,21,0)) then
        player:showText(npc, text.TATEN_BILTEN_SHOP_DIALOG);
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

