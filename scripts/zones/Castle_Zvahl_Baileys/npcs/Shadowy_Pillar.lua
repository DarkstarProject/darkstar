-----------------------------------
-- Area: Castle Zvahl Baileys 161
-- NPC: Shadowy Pillar
-- A Moogle Kupo d'Etat 13: A Challenge! You Could Be a Winner
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    --player:startEvent(88) -- Sent to Glacier
    player:startEvent(100) -- Summons stooge moogle
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
