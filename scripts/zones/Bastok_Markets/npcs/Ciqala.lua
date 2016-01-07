-----------------------------------
--  Area: Bastok Markets
--   NPC: Ciqala
--  Type: Merchant
-- @zone: 235
--  @pos -283.147 -11.319 -143.680
--
-- Auto-Script: Requires Verification
--
-- Updated Aug-09-2013 by Zerahn, based on bgwiki and gamerescape
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, CIQALA_SHOP_DIALOG);

    stock = {
        0x4006,   224,3,     --Bronze Knuckles
        0x4007,   828,3,     --Brass Knuckles
        0x4001,   129,3,     --Cesti
        0x4294,  1521,3,     --Brass Baghnakhs
        0x4015,   104,3,     --Cat Baghnakhs
        0x4292,   312,3,     --Bronze Hammer
        0x4293,  2083,3,     --Brass Hammer
        0x4299,    47,3,     --Maple Wand
        0x4280,    66,3,     --Ash Club
        0x42A3,    90,3,     --Bronze Rod
        0x42B9,   621,3,     --Brass Rod
        0x42C0,    57,3,     --Ash Staff
        0x42C7,   386,3      --Ash Pole
    }
    showNationShop(player, BASTOK, stock);

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
