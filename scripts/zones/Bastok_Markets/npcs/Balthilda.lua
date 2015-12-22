-----------------------------------
--  Area: Bastok Markets
--   NPC: Balthilda
--  Type: Merchant
-- @zone: 235
--  @pos -300 -10 -161
--
-- NPC not found in 'npc_list'
--
-- Auto-Script: Requires Verification. Verified standard dialog - thrydwolf 12/18/2011
--
-- Updated Aug-09-2013 by Zerahn, based on bgwiki and gamerescape
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
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
    player:showText(npc, BALTHILDA_SHOP_DIALOG);

    stock = {
        0x30B9,  1904,3,     --Poet's Circlet
        0x3140,  1288,3,     --Tunic
        0x3139,  2838,3,     --Linen Robe
        0x31C0,   602,3,     --Mitts
        0x31B9,  1605,3,     --Linen Cuffs
        0x3240,   860,3,     --Slacks
        0x3239,  2318,3,     --Linen Slops
        0x32C0,   556,3,     --Solea
        0x32B9,  1495,3,     --Holly Clogs
        0x349D,  1150,3      --Leather Ring
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
