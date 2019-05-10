-----------------------------------
-- Area: Port San d'Oria
--  NPC: Nogelle
-- Starts Lufet's Lake Salt
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LUFET_S_LAKE_SALT) == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        LufetSalt = trade:hasItemQty(1019,3);
        if (LufetSalt == true and count == 3) then
            player:tradeComplete();
            player:addFame(SANDORIA,30);
            player:addGil(GIL_RATE*600);
            player:addTitle(dsp.title.BEAN_CUISINE_SALTER);
            player:completeQuest(SANDORIA,dsp.quest.id.sandoria.LUFET_S_LAKE_SALT);
            player:startEvent(11);
        end
    end
end;

function onTrigger(player,npc)

    local LufetsLakeSalt = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LUFET_S_LAKE_SALT);

    if (LufetsLakeSalt == 0) then
        player:startEvent(12);
    elseif (LufetsLakeSalt == 1) then
        player:startEvent(10);
    elseif (LufetsLakeSalt == 2) then
        player:startEvent(522);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 12 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.LUFET_S_LAKE_SALT);
    elseif (csid == 11) then
        player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*600);
    end
end;
