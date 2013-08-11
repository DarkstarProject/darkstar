-----------------------------------
-- Area: Windurst Walls
-- NPC: Scavnix
-- Standard merchant, though he acts like a guild merchant
-----------------------------------

package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/globals/settings");
--require("scripts/globals/shop");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if(player:sendGuild(60418,11,22,6)) then
        player:showText(npc,SCAVNIX_SHOP_DIALOG);
--        stock = {
--            0x01DA, 21000,   --Red Chip
--            0x01DB, 21000,   --Blue Chip
--            0x01DC, 21000    --Yellow Chip 
--            0x01DD, 21000,   --Green Chip
--            0x01DE, 21000,   --Clear Chip
--            0x01DE, 21000,   --Purple Chip
--            0x01E0, 21000,   --White Chip
--            0x01E1, 21000,   --Black Chip
--        }
--	showShop(player, STATIC, stock);
	end
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
