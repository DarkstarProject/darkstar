----------------------------------
-- Area: Vunkerl Inlet [S]
--  NPC: Indescript Markings
-- Type: Quest
-- !pos -629.179 -49.002 -429.104 1 83
-----------------------------------
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local pantsQuestProgress = player:getVar("AF_SCH_PANTS");

    player:delStatusEffect(dsp.effect.SNEAK);

    -- SCH AF Quest - Legs
    if (pantsQuestProgress > 0 and pantsQuestProgress < 3 and player:hasKeyItem(dsp.ki.DJINN_EMBER) == false) then
        player:addKeyItem(dsp.ki.DJINN_EMBER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.DJINN_EMBER);
        player:setVar("AF_SCH_PANTS", pantsQuestProgress + 1);
        npc:hideNPC(60);

    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
