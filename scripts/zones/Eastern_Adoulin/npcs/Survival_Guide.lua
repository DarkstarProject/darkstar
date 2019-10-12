require("scripts/globals/survival_guide")

function onTrigger(player, targetNpc)
    dsp.survivalGuide.onTrigger(player)
end

function onEventUpdate(player, csid, option)
    dsp.survivalGuide.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option, targetNpc)
    dsp.survivalGuide.onEventFinish(player, csid, option)
end
