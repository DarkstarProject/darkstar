-----------------------------------
-- Area: Port San d'Oria
--  NPC: Parcarin
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -9 -13 -151 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local WildcatSandy = player:getVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,13) == false) then
        player:startEvent(747);
    elseif player:getVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_PARCARIN)
    else
        player:startEvent(566);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 747) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",13,true);
    end

end;