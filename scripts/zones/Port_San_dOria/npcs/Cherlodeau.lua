-----------------------------------
-- Area: Port San d'Oria
--  NPC: Cherlodeau
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -20 -4 -69 232
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local WildcatSandy = player:getVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,12) == false) then
        player:startEvent(748);
    else
        player:startEvent(590);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 748) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",12,true);
    end

end;