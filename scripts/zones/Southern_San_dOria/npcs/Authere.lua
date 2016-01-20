-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Authere
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos 33 1 -31 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
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
    
    local WildcatSandy = player:getVar("WildcatSandy");
    
    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,1) == false) then
        player:startEvent(0x0329);
    elseif (player:getVar("BrothersCS") == 1) then
        player:startEvent(0x0255)  -- brothers cs
    else
        player:startEvent(0x025d)  -- when i grow up im gonna fight like trion
    end;
end 

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
    
    if (csid == 0x0329) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",1,true);
    elseif (csid == 0x0255) then
        player:setVar("BrothersCS", 0)
    end
end;

------- for later use
-- player:startEvent(0x0256)  -- did nothing no cs or speech