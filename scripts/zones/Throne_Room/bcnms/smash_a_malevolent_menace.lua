------------------------------------
-- Area: Throne Room
-- Name: Smash A Malevolent Menace
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/battlefield")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player,battlefield)
end

function onBattlefieldEnter(player,battlefield)
    -- Lose item even if you lose :(
    player:delKeyItem(dsp.ki.MEGA_BONANZA_KUPON)
end

function onBattlefieldLeave(player,battlefield,leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:getCurrentMission(AMK) == dsp.mission.id.amk.SMASH_A_MALEVOLENT_MENACE) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002);
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 32001 and player:getCurrentMission(AMK) == dsp.mission.id.amk.SMASH_A_MALEVOLENT_MENACE then
        if option == 1 then
            player:startEvent(5)
        end
        player:completeMission(AMK,dsp.mission.id.amk.SMASH_A_MALEVOLENT_MENACE)
        player:addMission(AMK,dsp.mission.id.amk.A_MOOGLE_KUPO_DETAT_FIN)
    end
end