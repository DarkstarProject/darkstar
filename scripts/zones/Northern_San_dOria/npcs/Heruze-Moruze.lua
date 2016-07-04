-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Heruze-Moruze
-- Involved in Mission: 2-3 Windurst
-- @pos -56 -3 36 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Northern_San_dOria/TextIDs");

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
    
    pNation = player:getNation();
    currentMission = player:getCurrentMission(pNation);
    
    if (pNation == WINDURST) then
        if (currentMission == THE_THREE_KINGDOMS and player:getVar("MissionStatus") == 1) then
            player:startEvent(0x0246);
        else
            player:startEvent(0x022a);
        end
    elseif (pNation == BASTOK) then
        player:startEvent(0x0242);
    elseif (pNation == SANDORIA) then
        player:startEvent(0x0241);
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
    
    if (csid == 0x0246) then
        player:setVar("MissionStatus",2);
    end
    
end;