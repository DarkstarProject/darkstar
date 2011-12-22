-----------------------------------
--  Area: Bastok Markets
--   NPC: Ciqala
--  Type: Merchant
-- @zone: 235
--  @pos: -283.147 -11.319 -143.680
--
-- Auto-Script: Requires Verification
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
	player:showText(npc, CIQALA_SHOP_DIALOG);

    stock = 
    {
        0x4008,4818,1,  --Metal Knuckles
        0x4103,11285,1, --Battleaxe
        0x4141,4186,1,  --Greataxe
        0x4294,6033,1,  --Warhammer

        0x4007,828,2,   --Brass Knuckles
        0x4101,1435,2,  --Brass Axe
        0x4140,618,2,   --Butterfly Axe
        0x4293,2129,2,  --Brass Hammer

        0x4006,224,3,   --Bronze Knuckles
        0x4100,290,3,   --Bronze Axe
        0x4292,312,3,   --Bronze Hammer
        0x4299,47,3,    --Maple Wand
        0x42C0,58,3     --Ash Staff
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

