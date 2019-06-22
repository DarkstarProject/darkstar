-----------------------------------
-- Area: Port San d'Oria
--  NPC: Nimia
-- Elshimo Lowlands Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
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
    if GetRegionOwner(dsp.region.ELSHIMOLOWLANDS) ~= dsp.nation.SANDORIA then
        player:showText(npc, ID.text.NIMIA_CLOSED_DIALOG)
    else
        local stock =
        {
            612,    55,    -- Kazham Peppers
            4432,   55,    -- Kazham Pineapple
            4390,   36,    -- Mithran Tomato
            626,   234,    -- Black Pepper
            630,    88,    -- Ogre Pumpkin
            632,   110,    -- Kukuru Bean
            1411, 1656,    -- Phalaenopsis
        }

        player:showText(npc, ID.text.NIMIA_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
