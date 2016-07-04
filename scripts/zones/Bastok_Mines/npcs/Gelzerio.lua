-----------------------------------
-- Area: Bastok Mines
-- NPC:  Galzerio
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,GELZERIO_SHOP_DIALOG);

    stock = {
        0x338E, 19602,1,     --Swordbelt
        0x43ED,   486,1,     --Bamboo Fishing Rod

        0x43F4,     3,2,     --Little Worm
        0x43EE,   212,2,     --Yew Fishing Rod

        0x338C, 10054,3,     --Silver Belt
        0x43F3,    10,3,     --Lugworm
        0x43EF,    64,3,     --Willow Fishing Rod
        0x3138,   216,3,     --Robe
        0x31B8,   118,3,     --Cuffs
        0x3238,   172,3,     --Slops
        0x32B8,   111,3,     --Ash Clogs
        0x30B0,  1742,3,     --Headgear
        0x3130,  2470,3,     --Doublet
        0x31B0,  1363,3,     --Gloves
        0x3230,  1899,3,     --Brais
        0x32B0,  1269,3         --Gaiters
    }
    showNationShop(player, BASTOK, stock);

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
