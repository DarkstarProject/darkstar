-----------------------------------
-- Area: Bastok Markets
--  NPC: Balthilda
-- Type: Merchant
-- !pos -300 -10 -161 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/shop");

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

    local stock =
    {
        0x30B9,  1904,  3,    -- Poet's Circlet
        0x3140,  1288,  3,    -- Tunic
        0x3139,  2838,  3,    -- Linen Robe
        0x31C0,   602,  3,    -- Mitts
        0x31B9,  1605,  3,    -- Linen Cuffs
        0x3240,   860,  3,    -- Slacks
        0x3239,  2318,  3,    -- Linen Slops
        0x32C0,   556,  3,    -- Solea
        0x32B9,  1495,  3,    -- Holly Clogs
        0x349D,  1150,  3     -- Leather Ring
    }
    showNationShop(player, NATION_BASTOK, stock);

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
