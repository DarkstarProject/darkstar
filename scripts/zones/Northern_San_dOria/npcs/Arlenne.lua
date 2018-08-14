-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arlenne
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    local stock =
    {
        17051,  1409, 1,    -- Yew Wand
        17090,  3245, 1,    -- Elm Staff
        17097, 16416, 1,    -- Elm Pole
        16770, 11286, 1,    -- Zaghnal
        17096,  4568, 2,    -- Holly Pole
        17024,    66, 3,    -- Ash Club
        17049,    46, 3,    -- Maple Wand
        17050,   333, 3,    -- Willow Wand
        17088,    57, 3,    -- Ash Staff
        17089,   571, 3,    -- Holly Staff
        17095,   386, 3,    -- Ash Pole
        16385,   132, 3,    -- Cesti
        16391,   828, 3,    -- Brass Knuckles
        16407,  1554, 3,    -- Brass Baghnakhs
        16768,   309, 3,    -- Bronze Zaghnal
        16769,  2542, 2,    -- Brass Zaghnal
    }

    player:showText(npc,ARLENNE_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.SANDORIA)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
