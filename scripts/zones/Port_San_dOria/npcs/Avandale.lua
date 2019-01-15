-----------------------------------
-- Area: Port San d'Oria
--   NPC: Avandale
-- Type: Standard NPC
-- !pos -105.524 -9 -125.274 232
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if player:getVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_AVANDALE)
    else
        player:startEvent(555);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
