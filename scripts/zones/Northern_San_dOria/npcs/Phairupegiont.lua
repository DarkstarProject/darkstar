-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Phairupegiont
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -46 0.1 76 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local WildcatSandy = player:getCharVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,8) == false) then
        player:startEvent(806);
    else
        player:startEvent(663);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 806) then
        player:setMaskBit(player:getCharVar("WildcatSandy"),"WildcatSandy",8,true);
    end

end;