-----------------------------------
-- Area: Upper Jeuno (244)
--  NPC: Inconspicuous Door
-- A Moogle Kupo d'Etat Mission NPC
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local jamInJeuno = player:getCurrentMission(AMK) == dsp.mission.id.amk.HASTEN_IN_A_JAM_IN_JEUNO
    local myDecrepitDomicile = player:getCurrentMission(AMK) == dsp.mission.id.amk.WELCOME_TO_MY_DECREPIT_DOMICILE
    local theProfessorsPrice = player:getCurrentMission(AMK) == dsp.mission.id.amk.AN_ERRAND_THE_PROFESSORS_PRICE
    local abuseOfAuthority = player:getCurrentMission(AMK) == dsp.mission.id.amk.SHOCK_ARRANT_ABUSE_OF_AUTHORITY
    local readTheFinePrint = player:getCurrentMission(AMK) == dsp.mission.id.amk.LENDER_BEWARE_READ_THE_FINE_PRINT
    local aTriumphantReturn = player:getCurrentMission(AMK) == dsp.mission.id.amk.RELIEF_A_TRIUMPHANT_RETURN

    local hasMetalStrip = player:hasKeyItem(dsp.ki.STURDY_METAL_STRIP)
    local hasTreeBark = player:hasKeyItem(dsp.ki.PIECE_OF_RUGGED_TREE_BARK)
    local hasLambRoast = player:hasKeyItem(dsp.ki.SAVORY_LAMB_ROAST)
    local hasWormeatenChest = player:hasKeyItem(dsp.ki.MOLDY_WORMEATEN_CHEST)

    if jamInJeuno then
        player:startEvent(10178)
        player:setVar("AMK4", 1)
    elseif myDecrepitDomicile and hasMetalStrip and player:getVar("AMK4") == 1 then
        player:startEvent(10179) -- Metal Strip handed in
    elseif myDecrepitDomicile and player:getVar("AMK4") == 1 then
        player:startEvent(10186) -- Metal Strip reminder
    elseif myDecrepitDomicile and hasTreeBark and player:getVar("AMK4") == 2 then
        player:startEvent(10180) -- Tree Bark handed in
    elseif myDecrepitDomicile and player:getVar("AMK4") == 2 then
        player:startEvent(10187) -- Tree Bark reminder
    elseif myDecrepitDomicile and hasLambRoast and player:getVar("AMK4") == 3 then
        player:startEvent(10181) -- Lamb Roast handed in
    elseif myDecrepitDomicile and player:getVar("AMK4") == 3 then
        player:startEvent(10188) -- Lamb Roast reminder
    elseif theProfessorsPrice and player:getVar("AMK6") == 1 then
        player:startEvent(10182)
    elseif abuseOfAuthority and hasWormeatenChest then
        player:startEvent(10183) -- Chest handed in
    elseif abuseOfAuthority then
        player:startEvent(10189) -- Reminder about chest
    elseif readTheFinePrint and player:getVar("AMK8") == 2 then
        player:startEvent(10184) -- Loan approved
    elseif aTriumphantReturn then
        player:startEvent(10185)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if csid == 10178 then
        player:completeMission(AMK,dsp.mission.id.amk.HASTEN_IN_A_JAM_IN_JEUNO)
        player:addMission(AMK,dsp.mission.id.amk.WELCOME_TO_MY_DECREPIT_DOMICILE)
    elseif csid == 10179 then
        player:delKeyItem(dsp.ki.STURDY_METAL_STRIP)
        player:setVar("AMK4", 2)
    elseif csid == 10180 then
        player:delKeyItem(dsp.ki.PIECE_OF_RUGGED_TREE_BARK)
        player:setVar("AMK4", 3)
    elseif csid == 10181 then
        player:delKeyItem(dsp.ki.SAVORY_LAMB_ROAST)
        player:setVar("AMK4", 0)
        player:completeMission(AMK,dsp.mission.id.amk.WELCOME_TO_MY_DECREPIT_DOMICILE)
        player:addMission(AMK,dsp.mission.id.amk.CURSES_A_HORRIFICALLY_HARROWING_HEX)
    elseif csid == 10182 then
        player:setVar("AMK6", 0)
        player:completeMission(AMK,dsp.mission.id.amk.AN_ERRAND_THE_PROFESSORS_PRICE)
        player:addMission(AMK,dsp.mission.id.amk.SHOCK_ARRANT_ABUSE_OF_AUTHORITY)
    elseif csid == 10183 then
        player:delKeyItem(dsp.ki.MOLDY_WORMEATEN_CHEST)
        player:completeMission(AMK,dsp.mission.id.amk.SHOCK_ARRANT_ABUSE_OF_AUTHORITY)
        player:addMission(AMK,dsp.mission.id.amk.LENDER_BEWARE_READ_THE_FINE_PRINT)
    elseif csid == 10184 then
        player:setVar("AMK8", 0)
        player:completeMission(AMK,dsp.mission.id.amk.LENDER_BEWARE_READ_THE_FINE_PRINT)
        player:addMission(AMK,dsp.mission.id.amk.RESCUE_A_MOOGLES_LABOR_OF_LOVE)
    elseif csid == 10185 then
        player:completeMission(AMK,dsp.mission.id.amk.RELIEF_A_TRIUMPHANT_RETURN)
        player:addMission(AMK,dsp.mission.id.amk.JOY_SUMMONED_TO_A_FABULOUS_FETE)
    end
end;
