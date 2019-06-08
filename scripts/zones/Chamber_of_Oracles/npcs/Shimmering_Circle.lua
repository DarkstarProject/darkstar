-----------------------------------
-- Area: Chamber of Oracles
-- NPC:  Shimmering Circle
-- !pos -220 0 12 168
-------------------------------------
require("scripts/globals/bcnm");
require("scripts/globals/keyitems")
-------------------------------------

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end

function onTrigger(player,npc)
    local hasTalisman = player:hasKeyItem(dsp.ki.NAVARATNA_TALISMAN)
    if (player:getCurrentMission(AMK) == dsp.mission.id.amk.RESCUE_A_MOOGLES_LABOR_OF_LOVE and hasTalisman) then
        player:startEvent(5)
    else
        EventTriggerBCNM(player,npc)
    end
end

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end

function onEventFinish(player,csid,option)
    if(csid == 5) then
        player:completeMission(AMK,dsp.mission.id.amk.RESCUE_A_MOOGLES_LABOR_OF_LOVE)
        player:addMission(AMK,dsp.mission.id.amk.ROAR_A_CAT_BURGLAR_BARES_HER_FANGS)
    else
        EventFinishBCNM(player,csid,option)
    end
end
