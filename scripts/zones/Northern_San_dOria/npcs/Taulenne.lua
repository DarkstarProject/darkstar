-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Taulenne
-- Armor Storage NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/armorstorage");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end

    dsp.armorStorage.onTrade(player, trade, 772);
end;

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 773);
end;

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 773);
end;

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 772, 773);
end;