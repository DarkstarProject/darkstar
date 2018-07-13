-----------------------------------
-- Area: Western Adoulin
--  NPC: Ledericus
-- Type: Shop NPC
--  @zone 256
--  !pos 37 32 117 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard shop
    player:showText(npc, LEDERICUS_SHOP_TEXT);
    local stock =
    {
        4916, 34000,  -- Scroll of Fira
        4917, 604800, -- Scroll of Fira II
        4918, 46440,  -- Scroll of Blizzara
        4919, 652800, -- Scroll of Blizzara II
        4920, 26600,  -- Scroll of Aerora
        4921, 556800, -- Scroll of Aerora II
        4922, 7476,   -- Scroll of Stonera
        4923, 504000, -- Scroll of Stonera II
        4924, 54600,  -- Scroll of Thundara
        4925, 722700, -- Scroll of Thundara II
        4926, 21000,  -- Scroll of Watera
        4927, 530265, -- Scroll of Watera II
        5102, 83160,  -- Scroll of Foil
        4692, 396825, -- Scroll of Haste II
        5105, 396825, -- Scroll of Flurry II
    }
    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
