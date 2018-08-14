-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Amaura
-- Involved in Quest: The Medicine Woman, To Cure a Cough
-- !pos -85 -6 89 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:hasKeyItem(dsp.ki.AMAURAS_FORMULA) == true) then
        if (trade:hasItemQty(920,1) == true and trade:hasItemQty(642,1) == true and trade:hasItemQty(846,1) == true and trade:getItemCount() == 3) then
            player:startEvent(637);
        end
    end

end;

function onTrigger(player,npc)

    medicineWoman = player:getQuestStatus(SANDORIA,THE_MEDICINE_WOMAN);
    toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);

    if (medicineWoman == QUEST_ACCEPTED) then
        amaurasFormulaKI = player:hasKeyItem(dsp.ki.AMAURAS_FORMULA);
        coldMedicine = player:hasKeyItem(dsp.ki.COLD_MEDICINE);

        if (amaurasFormulaKI == false and coldMedicine == false) then
            player:startEvent(636);
        else
            player:startEvent(642);
        end
    elseif (player:getVar("DiaryPage") == 3 or toCureaCough == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.THYME_MOSS) == false and player:hasKeyItem(dsp.ki.COUGH_MEDICINE) == false) then
            player:startEvent(645); -- need thyme moss for cough med
        elseif (player:hasKeyItem(dsp.ki.THYME_MOSS) == true) then
            player:startEvent(646); -- receive cough med for Nenne
        end
    else
        player:startEvent(642);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 636 and option == 0) then
        player:addKeyItem(dsp.ki.AMAURAS_FORMULA);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.AMAURAS_FORMULA);
    elseif (csid == 637) then
        player:tradeComplete();
        player:delKeyItem(dsp.ki.AMAURAS_FORMULA);
        player:addKeyItem(dsp.ki.COLD_MEDICINE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.COLD_MEDICINE);
    elseif (csid == 645) then
        player:addQuest(SANDORIA,TO_CURE_A_COUGH);
    elseif (csid == 646) then
        player:delKeyItem(dsp.ki.THYME_MOSS);
        player:addKeyItem(dsp.ki.COUGH_MEDICINE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.COUGH_MEDICINE);
    end

end;