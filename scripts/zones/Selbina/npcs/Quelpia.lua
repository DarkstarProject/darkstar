-----------------------------------
-- Area: Selbina
-- NPC: Quelpia
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
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

player:showText(npc,QUELPIA_SHOP_DIALOG);

stock = {0x1202,585,        -- Scroll of Cure II
     0x1203,3261,        -- Scroll of Cure III
     0x1208,10080,        -- Scroll of Curaga II
     0x120C,5178,        -- Scroll of Raise
     0x1215,31500,        -- Scroll of Holy
     0x1218,10080,        -- Scroll of Dia II
     0x121D,8100,        -- Scroll of Banish II
     0x122C,6366,        -- Scroll of Protect II
     0x1231,15840,        -- Scroll of Shell II
     0x1239,18000,        -- Scroll of Haste
     0x1264,4644,        -- Scroll of Enfire
     0x1265,3688,        -- Scroll of Enblizzard
     0x1266,2250,        -- Scroll of Enaero
     0x1267,1827,        -- Scroll of Enstone
     0x1268,1363,        -- Scroll of Enthunder
     0x1269,6366}        -- Scroll of Enwater

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



