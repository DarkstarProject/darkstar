-----------------------------------
--  Area: Carpenters' Landing
--  NPC:  Beugungel
--  Type: Guild Merchant NPC (Woodworking Guild)
--  @pos -333.729, -5.512, 475.647 2
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Carpenters_Landing/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(534,5,22,0)) then
        player:showText(npc,BEUGUNGEL_SHOP_DIALOG);
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

