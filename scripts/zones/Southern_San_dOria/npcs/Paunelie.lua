-----------------------------------
--  Area: Port Bastok
--  NPC: Ilita
--  Linkshell merchant
--  @pos -142 -1 -25 236
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

player:showText(npc,PAUNELIE_SHOP_DIALOG,513);

stock = 
{
    0x0200,8000, -- Linkshell
    0x3f9d,375   -- Pendant Compass
}
showShop(player, STATIC, stock);
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



