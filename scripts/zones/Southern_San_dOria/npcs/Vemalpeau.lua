-----------------------------------
--    Area: Southern San d'Oria
--    NPC: Vemalpeau
-- Involved in Quests: Under Oath
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    
    if (player:getQuestStatus(SANDORIA,UNDER_OATH) == QUEST_ACCEPTED and player:getVar("UnderOathCS") == 0) then   -- Quest: Under Oath - PLD AF3
        player:startEvent(0x007); --Under Oath - mentions the boy missing
    elseif (player:getVar("UnderOathCS") == 3 and player:hasKeyItem(MIQUES_PAINTBRUSH)) then
        player:startEvent(0x005); --Under Oath - upset about the paintbrush
    elseif (player:getVar("UnderOathCS") == 4 and player:hasKeyItem(STRANGE_SHEET_OF_PAPER)) then
        player:startEvent(0x003); -- Under Oath - mentions commanding officer
    elseif (player:getVar("UnderOathCS") == 9 and player:hasKeyItem(KNIGHTS_CONFESSION)) then
        player:startEvent(0x002); -- Under Oath - Thanks you and concludes quest
    else
        player:startEvent(0x001);
    end
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

    if (csid == 0x007) then
        player:setVar("UnderOathCS", 1)
    elseif (csid == 0x005) then
        player:setVar("UnderOathCS", 4)
        player:delKeyItem(MIQUES_PAINTBRUSH);
    elseif (csid == 0x002) then
        player:setVar("UnderOathCS", 0)
        player:delKeyItem(KNIGHTS_CONFESSION);
    end
    
end;




