-----------------------------------
--     Area: Southern San d'Oria
--     NPC:  Femitte
--     Involved in Quest: Lure of the Wildcat (San d'Oria), Distant Loyalties
--     @pos -17 2 10 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end
    
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

    local DistantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");
    local DistantLoyalties = player:getQuestStatus(SANDORIA,DISTANT_LOYALTIES);
    local WildcatSandy = player:getVar("WildcatSandy");
    
    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,3) == false) then
        player:startEvent(0x0327);
    elseif (player:getFameLevel(SANDORIA) >= 4 and DistantLoyalties == 0) then
        player:startEvent(0x0297);
    elseif (DistantLoyalties == 1 and DistantLoyaltiesProgress == 1) then
        player:startEvent(0x0298);
    elseif (DistantLoyalties == 1 and DistantLoyaltiesProgress == 4 and player:hasKeyItem(MYTHRIL_HEARTS)) then
        player:startEvent(0x0299);
    else
        player:startEvent(0x295);
    end;
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x0327) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",3,true);
    elseif (csid == 0x0297 and option == 0) then
        player:addKeyItem(GOLDSMITHING_ORDER);
        player:messageSpecial(KEYITEM_OBTAINED,GOLDSMITHING_ORDER);
        player:addQuest(SANDORIA,DISTANT_LOYALTIES);
        player:setVar("DistantLoyaltiesProgress",1);
    elseif (csid == 0x0299) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13585);
        else
            player:delKeyItem(MYTHRIL_HEARTS);
            player:addItem(13585,1);
            player:messageSpecial(ITEM_OBTAINED,13585);
            player:setVar("DistantLoyaltiesProgress",0);
            player:completeQuest(SANDORIA,DISTANT_LOYALTIES);
        end;
    end;

end;

--------Other CS
--0x7fb4  
--0x0000  
--0x0295  Standard dialog
--0x0297  
--0x0298  
--0x0299  
--0x02d5  
--0x02eb  
--0x02ec  
--0x0327  Lure of the Wildcat
--0x03b1  CS with small mythra dancer