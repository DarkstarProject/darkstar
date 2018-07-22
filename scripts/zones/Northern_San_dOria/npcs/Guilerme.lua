-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Guillerme
--  Involved in Quest: Rosel the Armorer
-- !pos -4.500 0.000 99.000 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
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

function onTrigger(player,npc)

    -- "Rosel the Armorer" quest status var
    RoselTheArmorer = player:getQuestStatus(SANDORIA,ROSEL_THE_ARMORER);

    -- "Rosel the Armorer" - turn in reciept to prince
    if (RoselTheArmorer == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.RECEIPT_FOR_THE_PRINCE)) then
        player:startEvent(507);
    else
        player:showText(npc,GUILERME_DIALOG);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- "Rosel the Armorer", give receipt to NPC:Guilerme
    if (csid == 507) then
        player:delKeyItem(dsp.ki.RECEIPT_FOR_THE_PRINCE);
    end;

end;
