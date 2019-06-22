-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Emoussine
-- Type: Chocobo Renter
-- !pos -12.3 1.4 -98 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 600
local eventFail    = 603

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    dsp.chocobo.renterOnTrigger(player, eventSucceed, eventFail)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    dsp.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end
