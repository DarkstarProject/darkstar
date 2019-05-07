-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: Peddlestox
--   ID: 17281639
-- !pos -103.286 0.6 434.866 123
-----------------------------------
-- Active on WINDSDAY in this zone. To test on off-days, use:
-- !exec GetNPCByID(17281639):setStatus(dsp.status.NORMAL)
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
