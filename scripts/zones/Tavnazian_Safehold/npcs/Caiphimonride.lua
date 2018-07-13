-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Caiphimonride
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,CAIPHIMONRIDE_SHOP_DIALOG);

    local stock =
    {
        16450,1867,    --Dagger
    16566,8478,    --Longsword
    17335,8,    --Rusty Bolt
    18375,93240,    --Falx (COP Chapter 4 Needed; not implemented yet)
    18214,51905}    --Voulge (COP Chapter 4 Needed; not implemented yet)

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

