-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Tavourine
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
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
        16584, 37800, 1,    -- Mythril Claymore
        16466,  2182, 1,    -- Knife
        17060,  2386, 1,    -- Rod
        16640,   284, 2,    -- Bronze Axe
        16465,   147, 2,    -- Bronze Knife
        17081,   621, 2,    -- Brass Rod
        16583,  2448, 2,    -- Claymore
        17035,  4363, 2,    -- Mace
        17059,    90, 3,    -- Bronze Rod
        17034,   169, 3,    -- Bronze Mace
        16845, 16578, 3,    -- Lance
    }

    player:showText(npc,ID.text.TAVOURINE_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.SANDORIA)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
