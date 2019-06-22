-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Maloquedil
-- Involved in Quest : Warding Vampires, Riding on the Clouds, Lure of the Wildcat (San d'Oria)
-- !pos 35 0.1 60 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart Flyer
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.WARDING_VAMPIRES) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(1018,2) and trade:getItemCount() == 2) then -- Trade Shaman Garlic
            player:startEvent(23);
        end
    end

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 4) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_1",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SCOWLING_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SCOWLING_STONE);
        end
    end

end;

function onTrigger(player,npc)

    local warding = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.WARDING_VAMPIRES);
    local WildcatSandy = player:getVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,7) == false) then
        player:startEvent(807);
    elseif (warding == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then --Quest available for fame superior or equal to 3
        player:startEvent(24);
    elseif (warding == QUEST_ACCEPTED) then --Quest accepted, and he just tell me where to get item.
        player:startEvent(22);
    elseif (warding == QUEST_COMPLETED) then --Since the quest is repeatable, he tells me where to find (again) the items.
        player:startEvent(22);
    else
        player:startEvent(21);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 24 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.WARDING_VAMPIRES);
    elseif (csid == 23) then
        player:tradeComplete();
        player:addTitle(dsp.title.VAMPIRE_HUNTER_DMINUS);
        player:addGil(GIL_RATE*900);
        player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*900);
        if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.WARDING_VAMPIRES) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,dsp.quest.id.sandoria.WARDING_VAMPIRES);
        else
            player:addFame(SANDORIA,5);
        end
    elseif (csid == 807) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",7,true);
    end
end;
