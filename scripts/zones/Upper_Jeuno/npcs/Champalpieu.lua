-----------------------------------
-- Area: Upper Jeuno
-- NPC: Champalpieu
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs");
require("scripts/globals/shop");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, MP_SHOP_DIALOG);

    local stock =
    {
        4365,120,    --Rolanberry
        17320, 7,    --Iron Arrow
        17336, 5,    --Crossbow Bolt
        605, 180,    --Pickaxe
        5064,567,    --Wind Threnody
        5067,420     --Water Threnody
    }

    showShop(player, STATIC, stock);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

