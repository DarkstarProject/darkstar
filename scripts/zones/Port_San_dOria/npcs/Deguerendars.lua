-----------------------------------
-- Area: Port San d'Oria
--  NPC: Deguerendars
-- Tavnazian Archipelago Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    if player:getCurrentMission(COP) >= THE_SAVAGE then
        if GetRegionOwner(dsp.region.TAVNAZIANARCH) ~= dsp.nation.SANDORIA then
            player:showText(npc, DEGUERENDARS_CLOSED_DIALOG)
        else
            local stock =
            {
                1523,  290,    -- Apple Mint
                5164, 1945,    -- Ground Wasabi
                17005,  99,    -- Lufaise Fly
                5195,  233,    -- Misareaux Parsley
                1695,  920,    -- Habanero Peppers
            }

            player:showText(npc, DEGUERENDARS_OPEN_DIALOG)
            dsp.shop.general(player, stock, SANDORIA)
        end
    else
        player:showText(npc, DEGUERENDARS_COP_NOT_COMPLETED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
