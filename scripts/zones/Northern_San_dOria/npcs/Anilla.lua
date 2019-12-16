-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Anilla
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos 8 0.1 61 231
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

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,6) == false) then
        player:startEvent(808);
    else
        player:startEvent(586);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 808) then
        player:setMaskBit(player:getCharVar("WildcatSandy"),"WildcatSandy",6,true);
    end

end;