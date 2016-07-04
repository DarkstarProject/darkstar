-----------------------------------
--    Area: Southern San d'Oria
--    NPC: Celyddon
--  General Info NPC
--    @zone 230 
--    @pos -129 -6 90 
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

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
 
    ASquiresTest = player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST)
    
    if ASquiresTest == (QUEST_AVAILABLE) then
        player:startEvent(0x26A); -- im looking for the examiner
    elseif ASquiresTest == (QUEST_ACCEPTED) then
        player:startEvent(0x026b) -- i found the examiner but said i had to use sword
    else
        player:startEvent(0x026c) -- says i needs a revival tree root
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
end;




