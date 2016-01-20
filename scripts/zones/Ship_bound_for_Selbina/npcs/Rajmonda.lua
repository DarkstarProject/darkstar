-----------------------------------
-- Area: Ship bound for Selbina
-- NPC: Rajmonda
-- Type: Guild Merchant: Fishing Guild 
-- @pos 1.841 -2.101 -9.000 220
-----------------------------------
package.loaded["scripts/zones/Ship_bound_for_Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Ship_bound_for_Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(520,1,23,5)) then
        player:showText(npc,RAJMONDA_SHOP_DIALOG);
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



