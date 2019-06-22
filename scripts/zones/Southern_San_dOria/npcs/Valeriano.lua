-----------------------------------
-- Area: Southern_San_dOria
--  NPC: Valeriano
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/conquest")
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
        4394,     10,    -- Ginger Cookie
        17345,    43,    -- Flute
        17347,   990,    -- Piccolo
        5017,    585,    -- Scroll of Scop's Operetta
        5018,  16920,    -- Scroll of Puppet's Operetta
        5013,   2916,    -- Scroll of Fowl Aubade
        5027,   2059,    -- Scroll of Advancing March
        5072,  90000,    -- Scroll of Goddess's Hymnus
        5054,  32844,    -- Scroll of Fire Carol II
        5056,  30912,    -- Scroll of Wind Carol II
        5057,  27140,    -- Scroll of Earth Carol II
        5059,  28520,    -- Scroll of Water Carol II
        4996, 123880,    -- Scroll of Mage's Ballad III
    }

    player:showText(npc, ID.text.VALERIANO_SHOP_DIALOG)
    dsp.shop.general(player, stock, SANDORIA)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
