-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Perfaumand
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos -39 -3 69 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");

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

    local WildcatSandy = player:getVar("WildcatSandy");
    
    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,18) == false) then
        player:startEvent(0x0230);
    else
        player:startEvent(0x020a);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    if (csid == 0x0230) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",18,true);
    end

end;