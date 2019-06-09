-----------------------------------
-- Area: Throne Room
-- NPC:  Ore Door
-------------------------------------
require("scripts/globals/bcnm");

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end

function onTrigger(player,npc)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    local bonanzaCoupon = player:hasKeyItem(dsp.ki.MEGA_BONANZA_KUPON)

    if youCouldBeAWinner and bonanzaCoupon then
        player:startEvent(4);
    end

    if (EventTriggerBCNM(player,npc)) then
        return 1;
    end
end

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end

function onEventFinish(player,csid,option)
    if (csid == 4) then
        player:completeMission(AMK,dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER)
        player:addMission(AMK,dsp.mission.id.amk.SMASH_A_MALEVOLENT_MENACE)
    else
        EventFinishBCNM(player,csid,option)
    end
end