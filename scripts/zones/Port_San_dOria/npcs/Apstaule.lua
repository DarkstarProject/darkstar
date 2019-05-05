-----------------------------------
-- Area: Port San d'Oria
--  NPC: Apstaule
-- Not used cutscenes: 541
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/quests");
require("scripts/globals/shop");

local quests = dsp.quest.involvedQuests({
    require("scripts/quests/sandoria/the_brugaire_consortium")
})
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local count = trade:getItemCount();
    local MagicFlyer    = trade:hasItemQty(532,1);

    if (MagicFlyer == true and count == 1) then
        local FlyerForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);
        if (FlyerForRegine == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    else
        quests.onTrade(player, npc, trade)
    end

end;

function onTrigger(player,npc)
    player:startEvent(542) -- Standard dialogue
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    quests.onEventFinish(player, csid, option)
end;
