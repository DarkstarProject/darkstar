-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Explorer Moogle
-- 
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/teleports");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        count = trade:getItemCount();
        MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end; 

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

accept = 0;
event  = 0x035e;
    
    if (player:getGil() < 300) then
        accept = 1;
    end
    if (player:getMainLvl() < EXPLORER_MOOGLE_LEVELCAP) then
        event = event + 1;
    end
    player:startEvent(event,player:getZoneID(),0,accept);    
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

    local price = 300;
    
    if (csid == 0x035e) then
        if (option == 1 and player:delGil(price)) then        
            toExplorerMoogle(player,231);
        elseif (option == 2 and player:delGil(price)) then    
            toExplorerMoogle(player,234);
        elseif (option == 3 and player:delGil(price)) then    
            toExplorerMoogle(player,240);
        elseif (option == 4 and player:delGil(price)) then    
            toExplorerMoogle(player,248);
        elseif (option == 5 and player:delGil(price)) then    
            toExplorerMoogle(player,249);
        end
    end
end;