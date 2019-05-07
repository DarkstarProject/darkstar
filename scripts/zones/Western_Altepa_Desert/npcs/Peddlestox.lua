-----------------------------------
-- Area: Western Altepa Desert
--  NPC: Peddlestox
--   ID: 17289769
-- !pos 512.374 0.019 10.57 125
-----------------------------------
-- Active on EARTHSDAY in this zone. To test on off-days, use:
-- !exec GetNPCByID(17289769):setStatus(dsp.status.NORMAL)
-----------------------------------
function onTrigger(player)
    dsp.bmt.handleNpcOnTrigger(player)
end

function onTrade(player,npc,trade)
    dsp.bmt.handleNpcOnTrade(player,trade)
end

function onEventFinish(player,csid,option)
    dsp.bmt.handleNpcOnEventFinish(player,csid)
end
