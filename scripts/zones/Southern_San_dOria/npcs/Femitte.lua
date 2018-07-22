-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Femitte
-- Involved in Quest: Lure of the Wildcat (San d'Oria), Distant Loyalties
-- !pos -17 2 10 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local DistantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");
    local DistantLoyalties = player:getQuestStatus(SANDORIA,DISTANT_LOYALTIES);
    local WildcatSandy = player:getVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,3) == false) then
        player:startEvent(807);
    elseif (player:getFameLevel(SANDORIA) >= 4 and DistantLoyalties == 0) then
        player:startEvent(663);
    elseif (DistantLoyalties == 1 and DistantLoyaltiesProgress == 1) then
        player:startEvent(664);
    elseif (DistantLoyalties == 1 and DistantLoyaltiesProgress == 4 and player:hasKeyItem(dsp.ki.MYTHRIL_HEARTS)) then
        player:startEvent(665);
    else
        player:startEvent(661);
    end;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 807) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",3,true);
    elseif (csid == 663 and option == 0) then
        player:addKeyItem(dsp.ki.GOLDSMITHING_ORDER);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.GOLDSMITHING_ORDER);
        player:addQuest(SANDORIA,DISTANT_LOYALTIES);
        player:setVar("DistantLoyaltiesProgress",1);
    elseif (csid == 665) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13585);
        else
            player:delKeyItem(dsp.ki.MYTHRIL_HEARTS);
            player:addItem(13585,1);
            player:messageSpecial(ITEM_OBTAINED,13585);
            player:setVar("DistantLoyaltiesProgress",0);
            player:completeQuest(SANDORIA,DISTANT_LOYALTIES);
        end;
    end;

end;

--------Other CS
--32692
--0
--661  Standard dialog
--663
--664
--665
--725
--747
--748
--807  Lure of the Wildcat
--945  CS with small mythra dancer