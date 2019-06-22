-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Hae Jakhya
--  General Info NPC
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/keyitems")
require("scripts/globals/settings");
require("scripts/globals/quests");
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
end;

function onTrigger(player,npc)

    chasingStatus = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.CHASING_TALES);

    if (player:getVar("CHASING_TALES_TRACK_BOOK") == 1 and player:hasKeyItem(dsp.ki.A_SONG_OF_LOVE) == false) then
        player:startEvent(611); -- Neeed CS here
    elseif (player:hasKeyItem(dsp.ki.A_SONG_OF_LOVE) == true) then
        player:startEvent(612,0,dsp.ki.A_SONG_OF_LOVE);
    else
        player:startEvent(610);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 611) then
        player:addKeyItem(dsp.ki.A_SONG_OF_LOVE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.A_SONG_OF_LOVE);
    end
end;
