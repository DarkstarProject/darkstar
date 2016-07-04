-----------------------------------
--  Area: Northern San d'Oria
--  NPC:  Guillerme
--  Involved in Quest: Rosel the Armorer
--  @zone: 231
--  @pos -4.500 0.000 99.000
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
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

    -- "Rosel the Armorer" quest status var
    RoselTheArmorer = player:getQuestStatus(SANDORIA,ROSEL_THE_ARMORER);
    
    -- "Rosel the Armorer" - turn in reciept to prince
    if (RoselTheArmorer == QUEST_ACCEPTED and player:hasKeyItem(RECEIPT_FOR_THE_PRINCE)) then
        player:startEvent(0x01fb);
    else
        player:showText(npc,GUILERME_DIALOG);
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

    -- "Rosel the Armorer", give receipt to NPC:Guilerme
    if (csid == 0x01fb) then
        player:delKeyItem(RECEIPT_FOR_THE_PRINCE);
    end;
        
end;




