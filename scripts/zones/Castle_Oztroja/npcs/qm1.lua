-----------------------------------
-- Area: Castle Oztroja
--  NPC: qm1 (???)
-- Involved in Quest: True Strength
-- !pos -100 -71 -132 151
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Castle_Oztroja/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,dsp.quests.ids.bastok.TRUE_STRENGTH) == QUEST_ACCEPTED and player:hasItem(1100) == false) then
        if (trade:hasItemQty(4558,1) and trade:getItemCount() == 1) then -- Trade Yagudo Drink
            player:tradeComplete();
            player:messageSpecial(ID.text.SENSE_OF_FOREBODING);
            SpawnMob(17396140):updateClaim(player);
        end
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;