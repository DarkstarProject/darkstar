-----------------------------------
-- Area: Silver Sea route to Al Zahbi
-- NPC:  Yahliq
-- Type: Guild Merchant: Fishing Guild 
-- @pos 4.986 -2.101 -12.026 59
-----------------------------------
package.loaded["scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(525,1,23,5)) then
        player:showText(npc,YAHLIQ_SHOP_DIALOG);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;


