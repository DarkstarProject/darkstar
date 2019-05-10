-----------------------------------
-- Area: Port San d'Oria
--  NPC: Croumangue
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    local stock =
    {
        4441,  837, 1,    -- Grape Juice
        4419, 6300, 1,    -- Mushroom Soup
        4404,  540, 1,    -- Roast Trout
        4423,  270, 2,    -- Apple Juice
        4537,  468, 2,    -- Roast Carp
        4560, 1355, 2,    -- Vegetable Soup
        4356,  180, 2,    -- White Bread
        4364,  108, 3,    -- Black Bread
        4535,  360, 3,    -- Boiled Crayfish
        4509,   10, 3,    -- Distilled Water
        4455,  180, 3,    -- Pebble Soup
    }

    player:showText(npc, ID.text.CROUMANGUE_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.SANDORIA)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
